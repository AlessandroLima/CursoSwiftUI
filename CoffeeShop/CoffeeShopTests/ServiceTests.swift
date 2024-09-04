//
//  ServiceTests.swift
//  CoffeeShopTests
//
//  Created by Alessandro Teixeira Lima on 22/02/24.
//

import XCTest

class ServiceTests: XCTestCase {
    
    // Teste para garantir que getAllOrders retorne uma lista de pedidos
    func testGetAllOrders() async {
        // Mock URLSession para simular o comportamento de uma sessão URLSession
        struct MockURLSessionData: URLSessionProtocolData {
            func data(from url: URL) async throws -> (Data, URLResponse) {
                // Criar dados simulados
                let ordersData = try! JSONEncoder().encode([Order(name: "John", coffeeName: "Latte", total: 3.5, size: "Medium")])
                let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
                return (ordersData, response)
            }
        }
        
        // Inicializar Service com URLSession falso
        let service = Service(sessionData: MockURLSessionData())
        
        // Testar getAllOrders
        do {
            let orders = try await service.getAllOrders()
            XCTAssertNotNil(orders) // Garantir que a lista de pedidos não é nula
            XCTAssertEqual(orders?.count, 1) // Garantir que a lista tenha um único pedido
        } catch {
            XCTFail("Erro inesperado: \(error)")
        }
    }
    
    // Teste para garantir que getAllOrders lida corretamente com erros
    func testGetAllOrdersWithError() async {
            // Mock URLSession para simular o comportamento de uma sessão URLSession
            struct MockURLSessionData: URLSessionProtocolData {
                func data(from url: URL) async throws -> (Data, URLResponse) {
                    // Simular um erro retornando uma resposta inválida
                    let response = HTTPURLResponse(url: url, statusCode: 500, httpVersion: nil, headerFields: nil)!
                    throw NetworkError.invalidResponse
                }
            }
            
            // Inicializar Service com URLSession falso
            let service = Service(sessionData: MockURLSessionData())
            
            // Testar getAllOrders com erro
            do {
                _ = try await service.getAllOrders()
                XCTFail("A chamada deve lançar um erro NetworkError.invalidResponse")
            } catch let error as NetworkError {
                XCTAssertEqual(error, NetworkError.invalidResponse) // Garantir que o erro retornado é NetworkError.invalidResponse
            } catch {
                XCTFail("Erro inesperado: \(error)")
            }
        }
}
