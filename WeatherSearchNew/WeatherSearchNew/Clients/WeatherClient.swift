//
//  WeatherClient.swift
//  WeatherSearchNew
//
//  Created by Alessandro Teixeira Lima on 16/02/24.
//

import Foundation

struct WeatherClient {
    
    let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSessionWrapper()) {
        self.session = session
    }
    
    func fetchWeather(location: Location) async throws -> Weather {
        let (data, response) = try await session.data(from: APIEndPoint.endPointURL(for: .weatherByLatLong(location.lat ?? 0.0, location.lon ?? 0.0)))
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let weather = try JSONDecoder().decode(Weather.self, from: data)
        
        return weather
        
    }
}
