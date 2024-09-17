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
    func makeCoffee(name: String, imageURL: String, price: Double) -> Coffee
}

struct DefaultCoffeeFactory: CooffeFactory {
    func makeCoffee(name: String, imageURL: String, price: Double) -> Coffee {
        return Coffee(name: name, imageURL: imageURL, price: price)
    }
}

extension Coffee {
    static func all(factory: CooffeFactory) -> [Coffee] {
        return [
            factory.makeCoffee(name: "Cappuccino", imageURL: "Cappuccino", price: 2.5),
            factory.makeCoffee(name: "Expresso", imageURL: "Expresso", price: 2.1),
            factory.makeCoffee(name: "Regular", imageURL: "Regular", price: 1.0),
        ]
    }
}


