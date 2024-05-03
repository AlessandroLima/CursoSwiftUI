//
//  APIEndPoint.swift
//  WeatherSearchNew
//
//  Created by Alessandro Teixeira Lima on 13/02/24.
//

import Foundation

enum APIEndPoint {
    static let baseURL = "https://api.openweathermap.org"
    
    case coordinatesByLocationName(String)
    case weatherByLatLong(Double, Double)
    
    private var path: String {
        switch self {
        case .coordinatesByLocationName(let city):
            return "/geo/1.0/direct?q=\(city)&appid=\(Constants.Keys.APIKey)"
        case .weatherByLatLong(let lat,  let long):
            return "/data/2.5/weather?lat=\(lat)&lon=\(long)&units=\(Constants.Keys.unit)&appid=\(Constants.Keys.APIKey)"
        }
    }
    
    static func endPointURL(for endpoint: APIEndPoint) -> URL {
        let endPointPath = endpoint.path
        return URL(string: baseURL+endPointPath)!
    }
}
