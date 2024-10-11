//
//  WebService.swift
//  Stocks
//
//  Created by Alessandro Teixeira Lima on 07/10/24.
//

import Foundation

class WebService {
    
    func getStocks(completion: @escaping (([Stock]?) -> Void)) {
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
            fatalError("Url is not correct")
        }
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            stocks != nil ? completion(stocks) : completion(nil)
        }.resume()
    }
        
    func getNews(completion: @escaping ( [New]?) -> Void)  {
        guard let url = URL(string: "https://island-bramble.glitch.me/top-news") else {
            fatalError("Url is not correct")
        }
        URLSession.shared.dataTask(with: url) {data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let news = try? JSONDecoder().decode([New].self, from: data)
            news != nil ? completion(news) : completion(nil)
        }.resume()
    }
}

struct Stock: Decodable {
    var symbol: String
    var description: String
    var price: Double
    var change: String
}

struct New: Decodable {
    var title: String
    var publication: String
    var imageURL: String
}
