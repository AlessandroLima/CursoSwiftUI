//
//  SearchView.swift
//  Stocks
//
//  Created by Alessandro Teixeira Lima on 07/10/24.
//

//import SwiftUI
//
//struct SearchView: View {
//
//    @Binding var searchTerm: String
//
//    var body: some View {
//        HStack {
//            Spacer()
//            Image(systemName: "magnifyingglass")
//            TextField("Search", text: self.$searchTerm)
//            .foregroundColor(Color.primary)
//            .frame(height: 40)
//            Spacer()
//        }.foregroundColor(Color.secondary)
//            .background(Color(.secondarySystemBackground))
//            .cornerRadius(10)
//            .padding(10)
//    }
//}
//
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView(searchTerm: .constant(""))
//    }
//}

import SwiftUI

struct SearchView: View {
    
    @Binding var searchTerm: String
    
    var body: some View {
      
        HStack {
                  Spacer()
                  Image(systemName: "magnifyingglass")
                  
                  TextField("Search", text: self.$searchTerm).foregroundColor(Color.primary)
                      .padding(10)
                  
                  Spacer()
              }.foregroundColor(.secondary)
                  .background(Color(.secondarySystemBackground))
                  .cornerRadius(10)
                  .padding(10)
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchTerm: .constant(""))
    }
}



