//
//  WeatherAppHomeViewModel.swift
//  NooroWeatherAppiOS
//
//  Created by Martin Maly on 2024-12-30.
//

import SwiftUI
import Combine

@MainActor
final class WeatherAppHomeViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var selectedLocation: LocationWithWeather?
    @Published var searchText = ""
    @Published var searchResults: [LocationWithWeather] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    // MARK: - Private Properties
    private let weatherService: WeatherAPIServicing
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialization
    init(weatherService: WeatherAPIServicing = WeatherAPIManager()) {
        self.weatherService = weatherService
        setupSearchSubscription()
    }
    
    // MARK: - Private Methods
    private func setupSearchSubscription() {
        $searchText
            .removeDuplicates()
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
            .filter { !$0.isEmpty }
            .map { [weak self] searchTerm -> AnyPublisher<[LocationWithWeather], Never> in
                guard let self = self else { return Just([]).eraseToAnyPublisher() }
                
                self.isLoading = true
                
                return Future { promise in
                    Task {
                        do {
                            let results = try await self.weatherService.searchLocationsWithWeather(query: searchTerm)
                            promise(.success(results))
                        } catch {
                            self.error = error
                            promise(.success([]))
                        }
                    }
                }
                .handleEvents(receiveCompletion: { [weak self] _ in
                    self?.isLoading = false
                })
                .eraseToAnyPublisher()
            }
            .switchToLatest()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] results in
                self?.searchResults = results
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Public Methods
    func selectLocation(_ location: LocationWithWeather) {
        Task {
            do {
                isLoading = true
                error = nil
                let updatedLocation = try await weatherService.getWeather(for: location.location.name)
                selectedLocation = updatedLocation
            } catch {
                self.error = error
            }
            isLoading = false
        }
    }
}
