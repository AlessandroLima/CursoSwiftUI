//
//  Cooffe.swift
//  CooffeShop
//
//  Created by Alessandro Teixeira Lima on 17/02/24.
//

import Foundation

struct Coffee {
    var name: String
    var imageURL: String
    var price: Double
}

protocol CooffeFactory {
    func makeCooffe(name: String, imageURL: String, price: Double) -> Coffee
}

struct DefaultCooffeFactory: CooffeFactory {
    func makeCooffe(name: String, imageURL: String, price: Double) -> Coffee {
        return Coffee(name: name, imageURL: imageURL, price: price)
    }
}

extension Coffee {
    static func all(factory: CooffeFactory) -> [Coffee] {
        return [
            factory.makeCooffe(name: "Cappuccino", imageURL: "Cappuccino", price: 2.5),
            factory.makeCooffe(name: "Espresso", imageURL: "Espresso", price: 2.1),
            factory.makeCooffe(name: "Regular", imageURL: "Regular", price: 1.0),
        ]
    }
}


