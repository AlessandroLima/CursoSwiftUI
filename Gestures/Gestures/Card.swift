//
//  CardView.swift
//  Gestures
//
//  Created by Alessandro Teixeira Lima on 18/09/24.
//
import Foundation
import SwiftUI

struct Card: View {
    let tapped: Bool
    
    // Variável de estado para rastrear a escala da view
    @State private var currentScale: CGFloat = 1.0
    @State private var lastScaleValue: CGFloat = 1.0
    
    var body: some View {
        VStack {
            Image("wolverine")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .scaleEffect(currentScale) // Aplicando a escala
                        .gesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    // A escala atual é o valor do gesto multiplicado pela última escala
                                    currentScale = lastScaleValue * value
                                }
                                .onEnded { value in
                                    // Ao finalizar o gesto, guardamos o valor final da escala
                                    lastScaleValue = 1.0
                                }
                        )
                        .animation(.easeInOut, value: currentScale)
            
            Text("Card")
                .font(.largeTitle)
                .foregroundColor(.white)
        }.frame(minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity)
        .background(tapped ? .orange : .purple)
        .cornerRadius(30)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Card(tapped: false)
    }
}
