//
//  WeatherAppHomeView.swift
//  NooroWeatherAppiOS
//
//  Created by Martin Maly on 2024-12-30.
//

import SwiftUI

struct WeatherAppHomeView: View {
    @StateObject private var viewModel = WeatherAppHomeViewModel()
    @FocusState private var isSearchFocused: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            SearchBar(searchText: $viewModel.searchText)
                .focused($isSearchFocused)
            
            if !viewModel.searchText.isEmpty {
                ZStack {
                    searchResultsListView
                    searchStatusView
                }
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
                            isSearchFocused = false
                        }
                }
            }
        }
    }
    
    private var searchStatusView: some View {
        VStack {
            Spacer()
            SearchStatusView(
                isLoading: viewModel.isLoading,
                error: viewModel.error,
                noResults: viewModel.searchResults.isEmpty && !viewModel.isLoading
            )
        }
    }
}
