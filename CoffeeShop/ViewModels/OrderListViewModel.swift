//
//  OrdersViewModel.swift
//  CoffeeShop
//
//  Created by Alessandro Teixeira Lima on 26/02/24.
//

import Foundation

class OrderListViewModel: ObservableObject {
    
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchOrders()
    }
    
    func fetchOrders() {
        
        Task {
            do {
                let orders = try await Service().getAllOrders()
                await MainActor.run{
                    orders.map { orders in
                        self.orders = orders.map(OrderViewModel.init)
                    }
                }
                
            } catch {
                //handle error
                print(error)
            }
        }
    }
}

class OrderViewModel {
    
    let id = UUID()
    
    var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    var name : String {
        return self.order.name
    }
    
    var coffeeName : String {
        return self.order.coffeeName
    }
    
    var size : String {
        return self.order.size
    }
    
    var total : Double {
        return self.order.total
    }
    
    
}
