//
//  WeatherAppHomeView.swift
//  NooroWeatherAppiOS
//
//  Created by Martin Maly on 2024-12-30.
//

import SwiftUI

struct WeatherAppHomeView: View {
    @StateObject private var viewModel = WeatherAppHomeViewModel()
    
    var body: some View {
        VStack {
            // Search Bar
            SearchBar(searchText: $viewModel.searchText)
            
            Spacer()
            
            NoLocationSelectedView()
            
            Spacer()
        }
        .background(.primaryBackground)
    }
}

#Preview {
    WeatherAppHomeView()
}
