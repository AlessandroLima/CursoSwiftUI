//
//  AddCoffeeOrderViewModel.swift
//  CoffeeShop
//
//  Created by Alessandro Teixeira Lima on 05/09/24.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
    
    class DefaultCooffeFactory: CooffeFactory {
        func makeCoffee(name: String, imageURL: String, price: Double) -> Coffee {
            return Coffee(name: name, imageURL: imageURL, price: price)
        }
    }
    
    var name: String = ""
    
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""
    
    private var webService: Service
    
    let defaultCooffeFactory = DefaultCooffeFactory()
    
    var coffeeList: [Coffee]{
        return CoffeeListViewModel(coffeeList: Coffee.all(factory: defaultCooffeFactory)).coffeeList
    }
    
    init(with webService: Service) {
        self.webService = webService
    }
    
    var total: Double {
        return calculateTotalPrice()
    }
    
    func placeOrder() async {
        await self.webService.createOrder(with: Order(name: self.name,
                                                coffeeName: self.coffeeName,
                                                total: self.total,
                                                size: self.size))
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small":2.0, "Medium":3.0, "Large":4.0]
        return prices[self.size]!
    }

    func calculateTotalPrice() -> Double {
        let coffeeVM = coffeeList.first {$0.name == coffeeName}
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        }else {
            return 0.0
        }
    }
}
