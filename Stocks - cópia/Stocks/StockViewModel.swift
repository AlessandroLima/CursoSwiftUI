//
//  StocksViewModel.swift
//  Stocks
//
//  Created by Alessandro Teixeira Lima on 07/10/24.
//

import Foundation

struct StockViewModel {
    
    let stock: Stock
    
    var symbol: String {
        return stock.symbol.uppercased()
    }
    var description: String {
        return stock.description
    }
    var price: String {
        return String(format: "%.2f", stock.price)
    }
    var change: String {
        return stock.change
    }
}


