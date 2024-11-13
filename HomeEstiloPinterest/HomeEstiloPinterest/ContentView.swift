//
//  ContentView.swift
//  HomeEstiloPinterest
//
//  Created by Alessandro Teixeira Lima on 11/11/24.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        VStack {
           AsyncImageGridViewV2()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
