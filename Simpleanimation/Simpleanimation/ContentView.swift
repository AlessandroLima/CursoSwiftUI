//
//  ContentView.swift
//  Simpleanimation
//
//  Created by Alessandro Teixeira Lima on 01/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var showDetails: Bool = false
    
    var body: some View {
        VStack {
            Button {
                self.showDetails.toggle()
                } label: {
                    Text("Press Me")
                        .padding(.horizontal, 8)

                        .frame(height: 44)

                        .foregroundColor(.white)
                        .background(.green)
                        .cornerRadius(8)
                }
            HStack {
                Text(showDetails ? "Hide Details" : "Show Details")
                Image(systemName: "chevron.up.square")
                    .rotationEffect( .degrees(showDetails ? 0  : 180))
                    .animation(.default)
            }
            
            HStack {
                Text("🦟").font(.custom("Arial", size: 50))
                    .offset(x: showDetails ? UIScreen.main.bounds.width - 120:  0)
                    .animation(.interpolatingSpring(mass: 1.0, stiffness: 100, damping: 10, initialVelocity: 0))
                Spacer()
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
