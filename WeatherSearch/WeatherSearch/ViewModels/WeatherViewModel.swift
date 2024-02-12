//
//  WeatherViewModel.swift
//  WeatherSearch
//
//  Created by Alessandro Teixeira Lima on 12/02/24.
//

import Foundation
//import Combine

class WeatherViewModel: ObservableObject {
    private var weatherService: WeatherService!
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    func featchWeather(by city: String) {
        weatherService.getWeather(by: city) { weather in
            if let weather = weather {
                print("Aqui: ", weather)
            }
        }
    }
}
