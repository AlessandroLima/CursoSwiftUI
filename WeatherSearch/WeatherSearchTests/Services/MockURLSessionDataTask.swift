//
//  MockURLSessionDataTask.swift
//  WeatherSearchTests
//
//  Created by Alessandro Teixeira Lima on 12/02/24.
//

import Foundation
@testable import WeatherSearch

class MockURLSessionDataTask: URLSessionDataTask {
    var completionHandler: (() -> Void)?

    override func resume() {
        completionHandler?()
    }
}
