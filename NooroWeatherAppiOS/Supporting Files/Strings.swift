//
//  Strings.swift
//  NooroWeatherAppiOS
//
//  Created by Martin Maly on 2024-12-30.
//

import Foundation

enum Strings {
    static let SEARCH_BAR_PLACEHOLDER = NSLocalizedString(
        "SEARCH_BAR_PLACEHOLDER",
        value: "Search Location",
        comment: "Placeholder shown in search bar when user hasn't started searching yet"
    )
    
    static let NO_CITY_SELECTED = NSLocalizedString(
        "NO_CITY_SELECTED",
        value: "No City Selected",
        comment: "Title shown when no city is selected"
    )
    
    static let PLEASE_SEARCH = NSLocalizedString(
        "PLEASE_SEARCH",
        value: "Please Search For A City",
        comment: "Subtitle shown when no city is selected"
    )
    
    static let HUMIDITY = NSLocalizedString(
        "HUMIDITY",
        value: "Humidity",
        comment: "Hummidity title label value"
    )
    
    static let UV = NSLocalizedString(
        "UV",
        value: "UV",
        comment: "UV title label value"
    )
    
    static let FEELS_LIKE = NSLocalizedString(
        "FEELS_LIKE",
        value: "Feels Like",
        comment: "Feels Like title label value"
    )
    
    static let SEARCHING = NSLocalizedString(
        "SEARCHING",
        value: "Searching...",
        comment: "Label text that's displayed while searching for locations"
    )
    
    static let NO_LOCATIONS_FOUND = NSLocalizedString(
        "NO_LOCATIONS_FOUND",
        value: "No locations found",
        comment: "Label text that's displayed when a search returns no locations"
    )
}
