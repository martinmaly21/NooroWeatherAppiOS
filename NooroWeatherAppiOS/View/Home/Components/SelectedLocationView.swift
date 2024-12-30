//
//  SelectedLocationView.swift
//  NooroWeatherAppiOS
//
//  Created by Martin Maly on 2024-12-30.
//

import SwiftUI

struct SelectedLocationView: View {
    
    let locationWithWeather: LocationWithWeather
    
    var body: some View {
        return Text(locationWithWeather.location.name)
    }
    
}
