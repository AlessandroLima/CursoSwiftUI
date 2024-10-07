//
//  ContentView.swift
//  Stocks
//
//  Created by Alessandro Teixeira Lima on 07/10/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .leading) {
                Color.black
                Text("January 5 2024")
                    .foregroundColor(.gray)
                    .font(.custom("Arial", size: 25))
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -300)
            }
            .navigationBarTitle("Stocks")
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
