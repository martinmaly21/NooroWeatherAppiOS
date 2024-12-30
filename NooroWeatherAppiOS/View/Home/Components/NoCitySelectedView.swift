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
            Text("No City Selected")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Please Search For A City")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}
