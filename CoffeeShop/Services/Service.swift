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
    func dataInsert (from url: URL, with order: Order, completion: @escaping(Data?, URLResponse?, Error?)->())
}

struct URLSessionWrapper: URLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse) {
        return try await URLSession.shared.data(from: url)
    }
    
    func dataInsert (from url: URL, with order: Order, completion: @escaping(Data?, URLResponse?, Error?)->()) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let order = try? JSONEncoder().encode(order)
        request.httpBody = order
        URLSession.shared.dataTask(with: request){ data, response, error in
                completion(data, response, error)
        }.resume()
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
    
    func createOrder(with order: Order) async throws{
        
        let url = APIEndPoint.endPointURL(for: APIEndPoint.orders)
        
        session.dataInsert(from: url, with: order) { data, response, error in
            guard let data = data, error != nil else {
                return
            }
        }
    }
}
