//
//  OrderListView.swift
//  CoffeeShop
//
//  Created by Alessandro Teixeira Lima on 26/02/24.
//

import SwiftUI

struct OrderListView: View {
    
    let orders: [OrderViewModel]
    
    init(orders: [OrderViewModel]) {
        self.orders = orders
    }
    
    var body: some View {
        List {
            ForEach(self.orders, id: \.id) { order
                HStack {
                    
                }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orders: [OrderViewModel(order: Order(id: 1, name: "name1", coffeeName: "coffeeName1", total: 1.0, size: "Medium"))])
    }
}
