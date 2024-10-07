//
//  NewsListViewModel.swift
//  Stocks
//
//  Created by Alessandro Teixeira Lima on 07/10/24.
//

import Foundation


class NewsListViewModel: ObservableObject {
    
    @Published  var news: [NewViewModel] = [NewViewModel]()
    
    var webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func load(){
        fetchNews()
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
