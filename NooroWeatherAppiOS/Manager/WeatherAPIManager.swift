//
//  WeatherAPIManager.swift
//  NooroWeatherAppiOS
//
//  Created by Martin Maly on 2024-12-30.
//

import Foundation

protocol WeatherAPIServicing {
   /// Searches for locations and fetches their current weather
   /// - Parameter query: Search term for location lookup
   /// - Returns: Array of locations with their current weather
   func searchLocationsWithWeather(query: String) async throws -> [LocationWithWeather]
   
   /// Fetches current weather for a specific location
   /// - Parameter location: Name of location to get weather for
   /// - Returns: Location with its current weather data
   func getWeather(for location: String) async throws -> LocationWithWeather
}

/// Manages API requests to the WeatherAPI service
class WeatherAPIManager: WeatherAPIServicing {
    private let apiKey: String = Constants.API.apiKey
    private let baseURL = Constants.API.baseURL
   
   func searchLocationsWithWeather(query: String) async throws -> [LocationWithWeather] {
       guard let url = URL(string: "\(baseURL)/search.json?key=\(apiKey)&q=\(query)") else {
           throw WeatherError.invalidURL
       }
       
       let (data, response) = try await URLSession.shared.data(from: url)
       
       guard let httpResponse = response as? HTTPURLResponse else {
           throw WeatherError.invalidResponse
       }
       
       guard (200...299).contains(httpResponse.statusCode) else {
           throw WeatherError.serverError(httpResponse.statusCode)
       }
       
       let locations = try JSONDecoder().decode([Location].self, from: data)
       
       return try await withThrowingTaskGroup(of: LocationWithWeather.self) { group in
           var results: [LocationWithWeather] = []
           results.reserveCapacity(locations.count)
           
           for location in locations {
               group.addTask {
                   return try await self.getWeather(for: location.name)
               }
           }
           
           for try await result in group {
               results.append(result)
           }
           
           return results.sorted { $0.location.name < $1.location.name }
       }
   }
   
   func getWeather(for location: String) async throws -> LocationWithWeather {
       guard let encodedLocation = location.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
             let url = URL(string: "\(baseURL)/current.json?key=\(apiKey)&q=\(encodedLocation)") else {
           throw WeatherError.invalidURL
       }
       
       let (data, response) = try await URLSession.shared.data(from: url)
       
       guard let httpResponse = response as? HTTPURLResponse else {
           throw WeatherError.invalidResponse
       }
       
       guard (200...299).contains(httpResponse.statusCode) else {
           throw WeatherError.serverError(httpResponse.statusCode)
       }
       
       return try JSONDecoder().decode(LocationWithWeather.self, from: data)
   }
}
