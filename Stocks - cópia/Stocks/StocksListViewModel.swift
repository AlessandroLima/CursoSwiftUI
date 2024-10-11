//
//  StocksListViewModel.swift
//  Stocks
//
//  Created by Alessandro Teixeira Lima on 07/10/24.
//

import Foundation

class StockListViewModel: ObservableObject {
    
    @Published var dragOffset: CGSize = CGSize(width: 0, height: 650)
    @Published var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = [StockViewModel]()
    @Published var news: [NewViewModel] = [NewViewModel]()
    
    var webService: WebService
    
    init(webService: WebService = WebService()) {
        self.webService = webService
        load()
    }
    
    func load() {
        fetchStocks()
        fetchNews()
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
    
    private func fetchNews() {
        
        webService.getNews { news in
            if let news = news {
                DispatchQueue.main.async {
                    self.news = news.map(NewViewModel.init)
                }
            }
        }
        
    }
    
}
