//
//  StockListView.swift
//  StocksAppSwiftUI
//
//  Created by Mohammad Azam on 1/7/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct StockListView: View {
    
    let stocks: [StockViewModel]
    
    var body: some View {
        List(self.stocks, id: \.symbol) { stock in
            StockCellView(stock: stock)
        }
        .listStyle(PlainListStyle())
    }
}

struct StockCellView: View {
    
    let stock: StockViewModel
    
    var body: some View {
        return HStack {
            VStack(alignment: .leading) {
                Text(stock.symbol)
                    .font(.custom("Arial",size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                Text(stock.description)
                    .font(.custom("Arial",size: 18))
                    .foregroundColor(Color.gray)
                
            }
            Spacer()
            
            VStack {
                Text("\(stock.price)")
                        .foregroundColor(Color.gray)
                        .font(.custom("Arial",size: 22))
                
                Button(stock.change) {
                                   
                               }
                            .frame(width: 75)
                            .padding(5)
                            .background(Color.red)
                            .foregroundColor(Color.white)
                            .cornerRadius(6)
            }
            
        }
        
    }
    
}


struct StockListView_Previews: PreviewProvider {
    static var previews: some View {
        
         let stock = Stock(symbol: "GOOG", description: "Google Stocks", price: 1200, change: "+0.23")
          return StockListView(stocks: [StockViewModel(stock: stock)])
    }
}
