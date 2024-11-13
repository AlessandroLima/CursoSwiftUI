//
//  ContentView.swift
//  GraficoRosca
//
//  Created by Alessandro Teixeira Lima on 04/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: Double = 0.0

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Fundo preto

            VStack {
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.3), lineWidth: 10) // Fundo do gráfico

                    Circle()
                        .trim(from: 0.0, to: CGFloat(progress / 100))
                        .stroke(
                            AngularGradient(
                                gradient: Gradient(colors: [Color.purple, Color.pink]),
                                center: .center
                            ),
                            style: StrokeStyle(lineWidth: 10, lineCap: .square)
                        )
                        .rotationEffect(.degrees(-90)) // Começa do topo

                    Text("\(Int(progress))%")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                .frame(width: 200, height: 200)

                Slider(value: $progress, in: 0...100, step: 1)
                    .padding()
                    .accentColor(.pink) // Cor do Slider
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
