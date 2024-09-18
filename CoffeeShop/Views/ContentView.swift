//
//  ContentView.swift
//  CoffeeShop
//
//  Created by Alessandro Teixeira Lima on 18/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListViewModel()
    @State private var showModal: Bool = false
    
    var body: some View {
        NavigationStack {
            OrderListView(orders: self.orderListVM.orders)
                .navigationBarTitle("Coffee Orders")
                .toolbarBackground( Color.gray, for: .navigationBar)
                .navigationBarItems(leading: Button(action: reloadOrders){
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(Color.white)
                }, trailing: Button(action: showAddCoffeeOrderView){
                    Image(systemName: "plus")
                        .foregroundColor(Color.white)
                })
                .sheet(isPresented: $showModal) {
                    AddCoffeeOrderView(isPresented: $showModal)
                }
        }
   }
    
    private func reloadOrders() {
        self.orderListVM.fetchOrders()
    }
    
    private func showAddCoffeeOrderView() {
        self.showModal = true
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                ContentView()
                ContentView().colorScheme(.dark)
            }
            
            
        }
    }
}
