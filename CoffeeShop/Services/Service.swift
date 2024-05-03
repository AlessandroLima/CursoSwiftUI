//
//  Service.swift
//  CoffeeShop
//
//  Created by Alessandro Teixeira Lima on 22/02/24.
//

import Foundation

enum APIEndPoint {
    static let baseURL = "https://island-bramble.glitch.me"
    
    case orders
    
    private var path: String {
        switch self {
        case .orders:
            return "/orders"
        }
    }
    
    static func endPointURL(for endpoint: APIEndPoint) -> URL {
        let endPointPath = endpoint.path
        let url = baseURL+endPointPath
        return URL(string: url)!
    }
}

struct Order: Codable, Equatable {
    
    var name: String
    var coffeeName: String
    var total: Double
    var size: String
    
    static func == (lhs: Order, rhs: Order)-> Bool {
        return lhs.name == rhs.name
        && lhs.coffeeName == rhs.coffeeName
        && lhs.total == rhs.total
        && lhs.size == rhs.size
    }
}


enum NetworkError : Error {
    case invalidResponse
}

protocol URLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse)
    func dataEntry(from url: URL, with order: Order) async throws -> (Data, URLResponse)
}
struct URLSessionWrapper: URLSessionProtocol {
    
    func dataEntry(from url: URL, with order: Order) async throws -> (Data, URLResponse){
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let orderData = try JSONEncoder().encode(order)
        request.httpBody = orderData
        
        let (data, response) = try await URLSession.shared.data(for: request)
        return (data, response)
    }
    
    
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
    
    
    func createOrder(with order: Order) async {
        
        let url = APIEndPoint.endPointURL(for: APIEndPoint.orders)
        
        Task {
            do {
                let (data, response) = try await session.dataEntry(from: url, with: order)
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("Status Code: \(httpResponse.statusCode)")
                }
                
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Response JSON: \(jsonString)")
                }
                
                
            }
            catch {
                print("Error: \(error)")
            }
        }
    }
}
