//
//  WeatherService.swift
//  WeatherSearch
//
//  Created by Alessandro Teixeira Lima on 12/02/24.
//

import Foundation

struct WeatherService {
    
    func getWeather(by city: String,
                    session: URLSessionProtocol = URLSession.shared,
                    completion: @escaping (Weather?) -> Void){
        
        let urlBase = "\(ServerEnvironment.urlBase.rawValue)q=\(city)&appId=\(ServerEnvironment.key.rawValue)&units=\(ServerEnvironment.unit.rawValue)"
        
        guard let url = URL(string: urlBase) else {
            completion(nil)
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    completion(nil)
                    return
                }

                if let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data), let weather = weatherResponse.main {
                    completion(weather)
                } else {
                    completion(nil)
                }
            }
            task.resume()
     }
}
