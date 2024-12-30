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
        VStack(spacing: 0) {
            // Search Bar
            SearchBar(searchText: $viewModel.searchText)
            
            // Either show search results or main content
            if !viewModel.searchText.isEmpty {
                searchResultsListView
            } else if let selectedLocation = viewModel.selectedLocation {
                SelectedLocationView(locationWithWeather: selectedLocation)
            } else {
                NoLocationSelectedView()
            }
        }
    }
    
    private var searchResultsListView: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.searchResults, id: \.location.id) { result in
                    LocationSearchResultView(locationWithWeather: result)
                        .onTapGesture {
                            viewModel.selectLocation(result)
                            viewModel.searchText = ""
                        }
                }
            }
        }
    }
}
