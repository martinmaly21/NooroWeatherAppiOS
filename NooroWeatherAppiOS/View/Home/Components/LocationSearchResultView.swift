//
//  LocationSearchResultView.swift
//  NooroWeatherAppiOS
//
//  Created by Martin Maly on 2024-12-30.
//

import SwiftUI

struct LocationSearchResultView: View {
    let locationWithWeather: LocationWithWeather
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 6) {
                Text(locationWithWeather.location.name)
                    .font(.poppins600(size: 20))
                    .foregroundStyle(.primaryText)
                
                HStack(alignment: .top, spacing: 6) {
                    Text("\(Int(round(locationWithWeather.weather.tempC)))")
                        .font(.poppins500(size: 60))
                        .foregroundStyle(.primaryText)
                        .lineLimit(1)
                    
                    Text("°")
                        .font(.poppins500(size: 16))
                        .foregroundStyle(.primaryText)
                        .padding(.top, 15)
                }
                .frame(height: 45)
            }
            .padding(.leading, 20)
            
            Spacer()
            
            AsyncImage(url: URL(string: "https:" + locationWithWeather.weather.condition.iconURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 83, height: 67)
            } placeholder: {
                Rectangle()
                    .fill(.clear)
                    .frame(width: 83, height: 67)
            }
            .padding(.trailing, 20)
        }
        .frame(height: 117)
        .background(.locationSearchResultBackground)
        .cornerRadius(16)
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
    }
}
