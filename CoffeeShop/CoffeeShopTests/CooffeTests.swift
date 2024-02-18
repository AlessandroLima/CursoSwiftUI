//
//  CooffeTests.swift
//  CooffeShopTests
//
//  Created by Alessandro Teixeira Lima on 17/02/24.
//

import XCTest

class CooffeTests: XCTestCase {
    
    // Mock CooffeFactory for testing
    class MockCooffeFactory: CooffeFactory {
        func makeCoffee(name: String, imageURL: String, price: Double) -> Coffee {
            return Coffee(name: name, imageURL: imageURL, price: price)
        }
    }
    
    func testAll() {
        // Given
        let mockFactory = MockCooffeFactory()
        
        // When
        let allCooffes = Coffee.all(factory: mockFactory)
        
        // Then
        XCTAssertEqual(allCooffes.count, 3)
        XCTAssertEqual(allCooffes[0].name, "Cappuccino")
        XCTAssertEqual(allCooffes[1].name, "Espresso")
        XCTAssertEqual(allCooffes[2].name, "Regular")
        XCTAssertEqual(allCooffes[0].imageURL, "Cappuccino")
        XCTAssertEqual(allCooffes[1].imageURL, "Espresso")
        XCTAssertEqual(allCooffes[2].imageURL, "Regular")
        XCTAssertEqual(allCooffes[0].price, 2.5)
        XCTAssertEqual(allCooffes[1].price, 2.1)
        XCTAssertEqual(allCooffes[2].price, 1.0)
    }
}
