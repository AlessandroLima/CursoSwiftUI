//
//  Environment.swift
//  WeatherSearch
//
//  Created by Alessandro Teixeira Lima on 12/02/24.
//

import Foundation

enum ServerEnvironment: String {
    case urlBaseWeather = "https://api.openweathermap.org/data/2.5/weather?"
    case urlBaseLocation = "https://api.openweathermap.org/geo/1.0/direct?"
    case key     = "3e40fae3f25784f4776d736951958715"
    case unit    = "metric"
}

