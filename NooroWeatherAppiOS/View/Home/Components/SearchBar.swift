//
//  SearchBar.swift
//  NooroWeatherAppiOS
//
//  Created by Martin Maly on 2024-12-30.
//


import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField(Strings.SEARCH_BAR_PLACEHOLDER, text: $searchText)
                .textFieldStyle(PlainTextFieldStyle())
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
