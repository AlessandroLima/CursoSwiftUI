//
//  Weather.swift
//  WeatherSearchNew
//
//  Created by Alessandro Teixeira Lima on 13/02/24.
//

import Foundation

struct Location: Decodable, Equatable {
    var name:    String?
    var lat:     Float?
    var lon:     Float?
    var country: String?
    var state:   String?
    
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.name == rhs.name
        && lhs.lat == rhs.lat
        && lhs.lon == rhs.lon
        && lhs.country == rhs.country
        && lhs.state == rhs.state
    }
}
