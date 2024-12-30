//
//  SearchResultWithWeather.swift
//  NooroWeatherAppiOS
//
//  Created by Martin Maly on 2024-12-30.
//

import Foundation

/// Represents a location with its current weather
struct LocationWithWeather: Codable {
    let location: Location
    let weather: Weather
    
    enum CodingKeys: String, CodingKey {
        case location
        case weather = "current"
    }
}
