//
//  CoffeeViewModel.swift
//  CoffeeShop
//
//  Created by Alessandro Teixeira Lima on 06/09/24.
//

import Foundation

class CoffeeListViewModel {
    var coffeeList: [Coffee]
    init(coffeeList: [Coffee]) {
        self.coffeeList = coffeeList
    }
}

struct CoffeeViewModel {
    var coffee: Coffee
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var name: String {
       return self.coffee.name
    }
    
    var imageURL: String {
       return self.coffee.imageURL
    }
    
    var price: Double {
        return self.coffee.price
    }
}
