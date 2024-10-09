//
//  teste.swift
//  Stocks
//
//  Created by Alessandro Teixeira Lima on 07/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black // Fundo preto
                .edgesIgnoringSafeArea(.all) // Ignora as bordas seguras para cobrir toda a tela
            
            VStack {
                Text("Item 1")
                    .padding()
                    .foregroundColor(.white) // Texto em branco
                
                Text("Item 2")
                    .padding()
                    .foregroundColor(.white) // Texto em branco
                
                Text("Item 3")
                    .padding()
                    .foregroundColor(.white) // Texto em branco
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
