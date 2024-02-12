//
//  Weather.swift
//  WeatherSearch
//
//  Created by Alessandro Teixeira Lima on 12/02/24.
//

import Foundation

struct WeatherResponse: Decodable, Equatable {
    var main:       Weather?
    
    static func ==(lhs: WeatherResponse, rhs: WeatherResponse) -> Bool {
        return lhs.main == rhs.main
    }
}


struct Weather: Decodable, Equatable {
    var temp:       Float?
    var feels_like: Float?
    var temp_min:   Float?
    var temp_max:   Float?
    var pressure:   Float?
    var humidity:   Float?
    
    static func ==(lhs: Weather, rhs: Weather) -> Bool {
        return lhs.temp == rhs.temp
        && lhs.feels_like == rhs.feels_like
        && lhs.temp_min == rhs.temp_min
        && lhs.temp_max == rhs.temp_max
        && lhs.pressure == rhs.pressure
        && lhs.humidity == rhs.humidity
    }
}
