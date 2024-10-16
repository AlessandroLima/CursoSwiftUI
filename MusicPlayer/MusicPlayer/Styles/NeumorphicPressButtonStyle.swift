
//
//  Neumorphing.swift
//  MapView
//
//  Created by Alessandro Teixeira Lima on 15/10/24.
//

import SwiftUI

import SwiftUI

struct NeumorphicPressButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(20)
            .background(
                Group {
                    if configuration.isPressed {
                        // Botão afundado ao pressionar
                        RoundedRectangle(cornerRadius: 100)
                            .fill(ColorTheme.background)
                            .shadow(color: ColorTheme.darkShadow, radius: 10, x: -5, y: -5)
                            .shadow(color: ColorTheme.lightShadow, radius: 10, x: 5, y: 5)
                    } else {
                        // Botão elevado normalmente
                        RoundedRectangle(cornerRadius: 100)
                            .fill(ColorTheme.background)
                            .shadow(color: ColorTheme.lightShadow, radius: 10, x: -10, y: -10)
                            .shadow(color: ColorTheme.darkShadow, radius: 10, x: 10, y: 10)
                    }
                }
            )
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0) // Leve efeito de escala
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed) // Animação suave
    }
}
