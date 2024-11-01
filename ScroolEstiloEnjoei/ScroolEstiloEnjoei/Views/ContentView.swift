//
//  ContentView.swift
//  ScroolEstiloEnjoei
//
//  Created by Alessandro Teixeira Lima on 01/11/24.
//

import SwiftUI

struct ContentView: View {
    
    let images = ["imagem1", "imagem2", "imagem3", "imagem4", "imagem1", "imagem2", "imagem3", "imagem1", "imagem2", "imagem3", "imagem4", "imagem5","imagem1", "imagem2", "imagem3", "", ""]
    
    var body: some View {
        VStack() {
            MiniaturesScrollView(largePhoto: 300, topBorder: 20, images: images)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
