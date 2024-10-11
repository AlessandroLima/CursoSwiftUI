//
//  NewsArticleView.swift
//  Stocks
//
//  Created by Alessandro Teixeira Lima on 07/10/24.
//
//
//import SwiftUI
//
//import URLImage
//
//struct NewsListView: View {
//
//    let news: [NewViewModel]
//    let onDragBegin: (DragGesture.Value) -> Void
//    let onDragEnd: (DragGesture.Value) -> Void
//
//    var body: some View {
//        let screenSize = UIScreen.main.bounds.size
//
//        return VStack(alignment: .leading) {
//            //Color.gray.ignoresSafeArea()
//
//            HStack {
//                VStack(alignment: .leading) {
//
//                    Text("Top News")
//                        .foregroundColor(Color.gray)
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                        .padding(2)
//
//
//                    Text("From News")
//                        .foregroundColor(Color.gray)
//                        .font(.body)
//                        .fontWeight(.bold)
//                        .padding(2)
//                }
//
//                Spacer()
//            }.padding().contentShape(Rectangle())
//                .gesture(DragGesture()
//                    .onChanged(self.onDragBegin)
//                    .onEnded(self.onDragEnd))
//            ScrollView {
//                VStack {
//                    ForEach(self.news, id: \.title) { new in
//                        ViewsCellView(new: new)
//                    }
//                }
//            }.frame(maxWidth: .infinity)
//
//        }.frame(width: screenSize.width, height: screenSize.height)
//                    .background(Color(red: 27/255, green: 28/255, blue: 30/255))
//                    .cornerRadius(20)
//
//    }
//
//}
//
//struct ViewsCellView: View {
//
//    let new: NewViewModel
//
//    var body: some View {
//
//        return HStack {
//            if let url = URL(string: new.imageURL) {
//                URLImage(url) { image in
//                    image
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                }.environment(\.urlImageOptions, URLImageOptions(
//                    maxPixelSize: CGSize(width: 100.0, height: 100.0)
//                ))
//                .frame(width: 100)
//                .cornerRadius(10)
//            }
//            VStack(alignment: .leading) {
//                Text(new.title)
//                    .font(.custom("Arial", size: 20))
//                    .bold()
//                    .foregroundColor(.gray)
//                Text(new.publication)
//                    .font(.custom("Arial", size: 15))
//                    .foregroundColor(.gray)
//            }
//
//        }
//    }
//
//}
//
//
//struct NewsArticleView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        let new = New(title: "The Bull Market is Charging into 2020",
//                      publication: "The Wallstreet Journal",
//                      imageURL: "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f2c667737950e6bf2338de1%2F0x0.jpg")
//        return NewsListView(news: [NewViewModel(new: new)], onDragBegin: { _ in }, onDragEnd: { _ in })
//    }
//}
import SwiftUI
import URLImage

struct NewsArticleView: View {
    
    let newsArticles: [NewViewModel]
    let onDragBegin: (DragGesture.Value) -> Void
    let onDragEnd: (DragGesture.Value) -> Void
    
    var body: some View {
        
        let screenSize = UIScreen.main.bounds.size
        
        return VStack(alignment: .leading) {
            
            HStack {
                VStack(alignment: .leading) {
                    
                    Text("Top News")
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(2)
                    
                    
                    Text("From News")
                        .foregroundColor(Color.gray)
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(2)
                }
                
                Spacer()
            }.padding().contentShape(Rectangle())
                .gesture(DragGesture()
                    .onChanged(self.onDragBegin)
                    .onEnded(self.onDragEnd))
            
            ScrollView {
                VStack {
                    ForEach(self.newsArticles, id: \.title) { article in
                        
                        HStack {
                            
                            if let url = URL(string: article.imageURL) {
                                URLImage(url) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }.environment(\.urlImageOptions, URLImageOptions(
                                    maxPixelSize: CGSize(width: 100.0, height: 100.0)
                                ))
                                .frame(width: 100)
                                .cornerRadius(20)
                            }
                            
                            VStack(alignment: .leading) {
                                Text(article.publication)
                                    .foregroundColor(Color.white)
                                    .font(.custom("Arial",size: 22))
                                    .fontWeight(.bold)
                                
                                Text(article.title)
                                    .font(.custom("Arial", size: 22))
                                    .foregroundColor(Color.white)
                            }
                            
                            Spacer()
                            
                        }
                        
                    }
                }.frame(maxWidth: .infinity)
            }
            
            
            
            
        }.frame(width: screenSize.width, height: screenSize.height)
            .background(Color(red: 27/255, green: 28/255, blue: 30/255))
            .cornerRadius(20)
        
        
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        
        let article = New(title: "News Title", publication: "The WallStreet Journal", imageURL: "https://prod.static9.net.au/_/media/2019/09/02/10/36/nine_news_melbourne_1600x900_fullstory_nightly6pm.jpg")
        
        return NewsArticleView(newsArticles: [NewViewModel(new: article)], onDragBegin: { _ in }, onDragEnd: { _ in })
    }
}
