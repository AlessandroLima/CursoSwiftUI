//
//  StocksListViewModel.swift
//  Stocks
//
//  Created by Alessandro Teixeira Lima on 07/10/24.
//

import Foundation

class StocksListViewModel: ObservableObject {
    var searchTerm: String = ""
    @Published  var stocks: [StockViewModel] = [StockViewModel]()
    var webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func load(){
        fetchStocks()
    }
    
    private func fetchStocks() {
        webService.getStocks { stocks in
            if let stocks = stocks {
                DispatchQueue.main.async {
                    self.stocks = stocks.map(StockViewModel.init)
                }
            }
        }
    }
}
