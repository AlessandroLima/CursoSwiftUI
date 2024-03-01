//
//  ContentView.swift
//  CoffeeShop
//
//  Created by Alessandro Teixeira Lima on 18/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListViewModel()
    
    var body: some View {
        OrderListView(orders: self.orderListVM.orders)
            .navigationBarTitle("Coffee Orders")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
