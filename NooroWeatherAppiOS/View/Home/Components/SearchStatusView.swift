//
//  SearchStatusView.swift
//  NooroWeatherAppiOS
//
//  Created by Martin Maly on 2024-12-30.
//

import SwiftUI

struct SearchStatusView: View {
    let isLoading: Bool
    let error: Error?
    let noResults: Bool
    
    var body: some View {
        VStack {
            if isLoading {
                HStack(spacing: 8) {
                    ProgressView()
                    Text(Strings.SEARCHING)
                        .font(.poppins500(size: 15))
                        .foregroundColor(.secondaryText)
                }
            } else if let error = error {
                Text(error.localizedDescription)
                    .font(.poppins500(size: 15))
                    .foregroundColor(.secondaryText)
            } else if noResults {
                Text(Strings.NO_LOCATIONS_FOUND)
                    .font(.poppins500(size: 15))
                    .foregroundColor(.secondary)
            }
        }
        .frame(height: 44)
        .frame(maxWidth: .infinity)
        .background(.statusBackground)
    }
}
