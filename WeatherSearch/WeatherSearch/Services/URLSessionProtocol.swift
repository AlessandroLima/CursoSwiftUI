//
//  URLSessionProtocol.swift
//  WeatherSearch
//
//  Created by Alessandro Teixeira Lima on 12/02/24.
//

import Foundation

protocol URLSessionProtocol {
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
    func dataTask(with url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {}
