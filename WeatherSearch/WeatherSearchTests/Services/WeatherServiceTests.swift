//
//  WeatherServiceTests.swift
//  WeatherSearchTests
//
//  Created by Alessandro Teixeira Lima on 12/02/24.
//

import XCTest

@testable import WeatherSearch

final class WeatherServiceTests: XCTestCase {

    func testGetWeather() {
            let jsonString = "{\"main\":{\"temp\": 25,\"feels_like\": 25,\"temp_min\": 24,\"temp_max\": 25,\"pressure\": 1021,\"humidity\": 67}}"
            let mockSession = MockURLSession()
            let weatherData = jsonString.data(using: .utf8)!
            mockSession.data = weatherData
            let service = WeatherService()

            var expectedResult: Weather?
        
            let expectedWeather: Weather = Weather(temp: 25,
                                          feels_like:    25,
                                          temp_min:      24,
                                          temp_max:      25,
                                          pressure:      1021,
                                          humidity:      67)
            
            service.getWeather(by: "London", session: mockSession) { weather in
                expectedResult = weather
            }

            XCTAssertEqual(expectedResult, expectedWeather)
        }

}
