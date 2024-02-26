//
//  APIEndPointTests.swift
//  CoffeeShopTests
//
//  Created by Alessandro Teixeira Lima on 22/02/24.
//

import XCTest

final class APIEndPointTests: XCTestCase {

    func testIfEndPointOrdersIsOk() {
        let endPoint = APIEndPoint.orders
        let url = APIEndPoint.endPointURL(for: endPoint)
        XCTAssertEqual(url.absoluteString, "\(APIEndPoint.baseURL)/\(endPoint)")
    }

}
