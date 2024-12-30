//
//  NoCitySelectedView.swift
//  NooroWeatherAppiOS
//
//  Created by Martin Maly on 2024-12-30.
//

import SwiftUI

struct NoCitySelectedView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text(Strings.NO_CITY_SELECTED)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(Strings.PLEASE_SEARCH)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}
