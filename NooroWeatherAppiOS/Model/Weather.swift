//
//  Weather.swift
//  NooroWeatherAppiOS
//
//  Created by Martin Maly on 2024-12-30.
//

import Foundation

/// Represents current weather conditions
struct Weather: Codable {
    struct Condition: Codable {
        let description: String
        let iconURL: String
        
        enum CodingKeys: String, CodingKey {
            case description = "text"
            case iconURL = "icon"
        }
    }
    
    let tempC: Double
    let condition: Condition
    let humidity: Int
    let feelslikeC: Double
    let uv: Double
    
    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case condition
        case humidity
        case feelslikeC = "feelslike_c"
        case uv
    }
}

