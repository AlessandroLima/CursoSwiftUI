//
//  OrdersTests.swift
//  CooffeShopTests
//
//  Created by Alessandro Teixeira Lima on 17/02/24.
//

import XCTest

final class OrdersTests: XCTestCase {
    
    func testIfOrderIsValid() {
        let jsonString = """
                             [
                               {
                                 "id": 1,
                                 "name": "a",
                                 "coffeeName": "a",
                                 "total": 1.2,
                                 "size": "a"
                               },
                               {
                                 "id": 2,
                                 "name": "b",
                                 "coffeeName": "b",
                                 "total": 3.4,
                                 "size": "b"
                               }
                             ]
                         """.data(using: .utf8)!
        let order1 = Order(name: "a", coffeeName: "a", total: 1.2, size: "a")
        let order2 = Order(name: "b", coffeeName: "b", total: 3.4, size: "b")
        let orders = [order1,order2]
        
        let ordersTest = try! JSONDecoder().decode([Order].self, from: jsonString)
        
        XCTAssertEqual(orders, ordersTest)
    }

   

}
