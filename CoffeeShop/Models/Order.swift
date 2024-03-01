//
//  Order.swift
//  CooffeShop
//
//  Created by Alessandro Teixeira Lima on 17/02/24.
//

import Foundation


struct Order: Codable, Equatable {
    
    //var id: Int
    var name: String
    var coffeeName: String
    var total: Double
    var size: String
    
    static func == (lhs: Order, rhs: Order)-> Bool {
        return /*lhs.id == rhs.id
        &&*/ lhs.name == rhs.name
        && lhs.coffeeName == rhs.coffeeName
        && lhs.total == rhs.total
        && lhs.size == rhs.size
    }
}
