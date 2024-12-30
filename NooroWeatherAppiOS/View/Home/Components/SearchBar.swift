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
            TextField(Strings.SEARCH_BAR_PLACEHOLDER, text: $searchText)
                .font(.poppins400(size: 15))
                .textFieldStyle(PlainTextFieldStyle())
            
            Image("search_24px")
                .resizable()
                .frame(width: 17.49, height: 17.49)
                .foregroundColor(.searchBarSearchIcon)
        }
        .frame(height: 46)
        .padding(.horizontal, 24)
        .background(.searchBarBackground)
        .cornerRadius(16)
        .padding(.horizontal)
    }
}
