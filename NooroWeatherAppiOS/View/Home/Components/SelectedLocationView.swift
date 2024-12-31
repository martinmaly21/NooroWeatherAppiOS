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
        VStack(alignment: .leading, spacing: 16) {
            AsyncImage(url: URL(string: "https:" + locationWithWeather.weather.condition.iconURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 123, height: 123)
            } placeholder: {
                Rectangle()
                    .fill(.gray.opacity(0.45))
                    .frame(width: 123, height: 123)
            }
            
            // Location name with arrow
            HStack(spacing: 8) {
                Text(locationWithWeather.location.name)
                    .font(.poppins600(size: 30))
                    .foregroundStyle(.primaryText)
                
                Image("LocationArrow")
                    .resizable()
                    .foregroundStyle(.primaryText)
                    .frame(width: 21, height: 21)
            }
            
            // Temperature display
            HStack(alignment: .top, spacing: 4) {
                Text("\(Int(round(locationWithWeather.weather.tempC)))")
                    .font(.poppins500(size: 70))
                    .foregroundStyle(.primaryText)
                
                Text("°")
                    .font(.poppins500(size: 24))
                    .foregroundStyle(.primaryText)
                    .padding(.top, 12)
            }
            
            // Weather info row
            HStack(spacing: 24) {
                // Humidity
                WeatherInfoItem(
                    title: Strings.HUMIDITY,
                    value: "\(Int(round(Double(locationWithWeather.weather.humidity))))%"
                )
                
                // UV Index
                WeatherInfoItem(
                    title: Strings.UV,
                    value: "\(Int(round(locationWithWeather.weather.uv)))"
                )
                
                // Feels like
                WeatherInfoItem(
                    title: Strings.FEELS_LIKE,
                    value: "\(Int(round(locationWithWeather.weather.feelslikeC)))°"
                )
            }
            .padding()
            .background(.locationWeatherDetailsBackground)
            .cornerRadius(16)
        }
        .padding(24)
        .frame(maxWidth: .infinity, alignment: .center)
        .cornerRadius(24)
    }
}
