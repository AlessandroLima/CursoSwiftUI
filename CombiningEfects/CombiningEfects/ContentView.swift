//
//  ContentView.swift
//  CombiningEfects
//
//  Created by Alessandro Teixeira Lima on 02/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showDetails: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("🐦")
                .font(.custom("Arial", size: 100))
                .scaleEffect(showDetails ? 2 : 1)
                .rotationEffect(.degrees(showDetails ? 360  : 0))
                .animation(.interpolatingSpring(mass: 1.0, stiffness: 100.0, damping: 10, initialVelocity: 0))
            Spacer()
            Button("Press Me ") {
                showDetails.toggle()
            }.frame(width: 200, height: 50)
                .background(.green)
                .foregroundColor(.white)
                .cornerRadius(50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
