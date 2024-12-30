//
//  WeatherAppHomeView.swift
//  NooroWeatherAppiOS
//
//  Created by Martin Maly on 2024-12-30.
//

import SwiftUI

struct WeatherAppHomeView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            // Search Bar
            SearchBar(searchText: $searchText)
            
            // No City Selected View
            Spacer()
            
            NoCitySelectedView()
            
            Spacer()
        }
    }
}

#Preview {
    WeatherAppHomeView()
}
