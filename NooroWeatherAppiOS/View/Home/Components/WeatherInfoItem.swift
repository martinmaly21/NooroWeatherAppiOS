//
//  WeatherInfoItem.swift
//  NooroWeatherAppiOS
//
//  Created by Martin Maly on 2024-12-30.
//

import SwiftUI

struct WeatherInfoItem: View {
    let title: String
    let value: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 4) {
                Text(title)
                    .font(.poppins500(size: 12))
                    .foregroundStyle(.secondaryTitleLabel)
            }
            
            Text(value)
                .font(.poppins500(size: 15))
                .foregroundStyle(.secondaryTitleValueLabel)
        }
    }
}
