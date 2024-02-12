//
//  MockURLSession.swift
//  WeatherSearchTests
//
//  Created by Alessandro Teixeira Lima on 12/02/24.
//

import Foundation

class MockURLSession: URLSessionProtocol {
    var data: Data?
    var response: URLResponse?
    var error: Error?

    func dataTask(with url: URL, completionHandler: @escaping URLSessionProtocol.DataTaskResult) -> URLSessionDataTask {
        let task = MockURLSessionDataTask()
        task.completionHandler = { [weak self] in
            completionHandler(self?.data, self?.response, self?.error)
        }
        return task
    }
}
