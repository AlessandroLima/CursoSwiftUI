//
//  AddCoffeeOrderView.swift
//  CoffeeShop
//
//  Created by Alessandro Teixeira Lima on 06/09/24.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel(with: Service())
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack{
            
            VStack {
                Form {
                    Section(header: Text("INFORMATION").font(.body)) {
                        TextField("Enter Your Name:", text: $addCoffeeOrderVM.name)
                    }
                    Section(header: Text("SELECT COFFEE").font(.body)) {
                        ForEach(addCoffeeOrderVM.coffeeList, id: \.name) { coffee in
                            CoffeeCellView(coffee: coffee, selection: self.$addCoffeeOrderVM.coffeeName)
                        }
                    }
                    Section(header: Text("SELECT SIZE").font(.body),
                            footer: OrderTotalView(total: self.addCoffeeOrderVM.total)) {
                        Picker("", selection: self.$addCoffeeOrderVM.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                HStack {
                    Button("Place Order") {
                        Task {
                            await self.addCoffeeOrderVM.placeOrder()
                            self.isPresented = false
                        }
                    }
                    .padding(EdgeInsets(top: 12,
                                         leading: 100,
                                         bottom: 12,
                                         trailing: 100))
                    .foregroundColor(.white)
                    .background(Color(red: 46/255, green: 204/255, blue: 113/255))
                    .cornerRadius(12)
                }
            }.navigationBarTitle("Add Order")
        }
    }
}

struct CreateOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
    }
}

struct CoffeeCellView: View {
    
    let coffee: Coffee
    @Binding var selection: String
    
    var body: some View {
        HStack{
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            Text(coffee.name)
                .font(.title)
                .padding([.leading],20)
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark": "")
        }.onTapGesture {
            self.selection = self.coffee.name
        }
    }
}
