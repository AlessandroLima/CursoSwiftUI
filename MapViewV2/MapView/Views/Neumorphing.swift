//
//  Neumorphing.swift
//  MapView
//
//  Created by Alessandro Teixeira Lima on 15/10/24.
//

import SwiftUI

struct NeumorphicPressButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .frame(width: 150, height: 150)
            .padding(20)
            .background(
                Group {
                    if configuration.isPressed {
                        // Botão afundado ao pressionar
                        RoundedRectangle(cornerRadius: 100)
                            .fill(Color(#colorLiteral(red: 0.92, green: 0.93, blue: 0.95, alpha: 1)))
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: -5, y: -5)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: 5, y: 5)
                    } else {
                        // Botão elevado normalmente
                        RoundedRectangle(cornerRadius: 100)
                            .fill(Color(#colorLiteral(red: 0.92, green: 0.93, blue: 0.95, alpha: 1)))
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -10, y: -10)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                    }
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0) // Leve efeito de escala
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed) // Animação suave
    }
}


struct NeumorphicView: View {
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.92, green: 0.93, blue: 0.95, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            Button("Pressione") {
                print("Botão pressionado!")
            }
            .font(.headline)
            .foregroundColor(.gray)
            .buttonStyle(NeumorphicPressButtonStyle()) // Aplicando o estilo customizado
        }
        
    }
    
}



struct Neumorphing_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphicView()
    }
}
