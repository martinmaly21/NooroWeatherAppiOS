//
//  Location.swift
//  NooroWeatherAppiOS
//
//  Created by Martin Maly on 2024-12-30.
//

import Foundation

/// Represents a geographical location
struct Location: Codable {
    let name: String
    let region: String
    let country: String
    
    var id: String {
        return name + region + country
    }
}
