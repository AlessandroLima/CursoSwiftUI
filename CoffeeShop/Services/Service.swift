//
//  Service.swift
//  CoffeeShop
//
//  Created by Alessandro Teixeira Lima on 22/02/24.
//

import Foundation

enum NetworkError : Error {
    case invalidResponse
}

protocol URLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse)
}

struct URLSessionWrapper: URLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse) {
        return try await URLSession.shared.data(from: url)
    }
}

struct Service {
    let session: URLSessionProtocol
   
    init(session: URLSessionProtocol = URLSessionWrapper()) {
        self.session = session
    }
    
    func getAllOrders() async throws -> [Order]? {
        let (data,response) = try await session.data(from: APIEndPoint.endPointURL(for: APIEndPoint.orders))
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let orders = try JSONDecoder().decode([Order].self, from: data)
        return orders
    }
}
