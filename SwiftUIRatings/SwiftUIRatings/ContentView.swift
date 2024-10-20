//
//  ContentView.swift
//  SwiftUIRatings
//
//  Created by Mohammad Azam on 6/20/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rating: Int?
    
    var body: some View {
        VStack {
            RatingView(rating: $rating)
             Text(rating != nil ? "You rating: \(rating!)" : "")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
