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
        if isLoading {
            HStack(spacing: 8) {
                ProgressView()
                Text("Searching...")
                    .foregroundColor(.secondary)
            }
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .background(Color(.systemBackground))
        } else if let error = error {
            Text(error.localizedDescription)
                .foregroundColor(.secondary)
                .frame(height: 44)
                .frame(maxWidth: .infinity)
                .background(Color(.systemBackground))
        } else if noResults {
            Text("No locations found")
                .foregroundColor(.secondary)
                .frame(height: 44)
                .frame(maxWidth: .infinity)
                .background(Color(.systemBackground))
        }
    }
}
