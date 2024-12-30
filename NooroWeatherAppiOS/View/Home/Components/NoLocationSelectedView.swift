//
//  NoLocationSelectedView.swift
//  NooroWeatherAppiOS
//
//  Created by Martin Maly on 2024-12-30.
//

import SwiftUI

struct NoLocationSelectedView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text(Strings.NO_CITY_SELECTED)
                .font(.poppins600(size: 30))
                .foregroundColor(.primaryText)
            
            Text(Strings.PLEASE_SEARCH)
                .font(.poppins600(size: 15))
                .foregroundColor(.primaryText)
        }
    }
}
