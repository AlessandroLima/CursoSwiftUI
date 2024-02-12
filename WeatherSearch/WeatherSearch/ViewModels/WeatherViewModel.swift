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
    
    @Published var weather = Weather()
    
    var cityName: String = ""
    
    var temperature: String {
        if let temp = self.weather.temp {
            return String(format: "%.0f", temp)
        } else {
            return ""
        }
    }
    
    var humidity: String {
        if let humidity = self.weather.pressure {
            return String(format: "%.0f", humidity)
        } else {
            return ""
        }
    }
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    func search() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            self.featchWeather(by: city)
        }
    }
    
    private func featchWeather(by city: String) {
        weatherService.getWeather(by: city) { weather in
            if let weather = weather {
                self.weather = weather
            }
        }
    }
}
