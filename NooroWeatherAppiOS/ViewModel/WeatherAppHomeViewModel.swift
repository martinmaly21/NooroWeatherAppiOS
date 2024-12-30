//
//  WeatherAppHomeViewModel.swift
//  NooroWeatherAppiOS
//
//  Created by Martin Maly on 2024-12-30.
//

import SwiftUI

final class WeatherAppHomeViewModel: ObservableObject {
    @Published var selectedLocation: Location?
    @Published var searchText = ""
}
