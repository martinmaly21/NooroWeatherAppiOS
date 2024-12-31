//
//  UserDefaultsManager.swift
//  NooroWeatherAppiOS
//
//  Created by Martin Maly on 2024-12-30.
//

import Foundation

struct UserDefaultsManager {
    
    static func saveLocation(_ location: Location) {
        if let encoded = try? JSONEncoder().encode(location) {
            UserDefaults.standard.set(encoded, forKey: Constants.UserDefaults.locationKey)
        }
    }
    
    static func loadLocation() -> Location? {
        guard let data = UserDefaults.standard.data(forKey: Constants.UserDefaults.locationKey),
              let location = try? JSONDecoder().decode(Location.self, from: data)
        else { return nil }
        return location
    }
}
