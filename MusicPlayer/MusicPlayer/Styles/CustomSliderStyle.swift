////
////  CustomSliderStyle.swift
////  MusicPlayer
////
////  Created by Alessandro Teixeira Lima on 16/10/24.
////
//
//import SwiftUI
//
//struct CustomSliderStyle: SliderStyle {
//    func makeBody(configuration: Configuration) -> some View {
//        ZStack {
//            // Trilho (Track)
//            RoundedRectangle(cornerRadius: 10)
//                .fill(ColorTheme.background)
//                .frame(height: 8)
//                .shadow(color: ColorTheme.darkShadow, radius: 10, x: 6, y: 6)
//                .shadow(color: ColorTheme.lightShadow, radius: 10, x: -6, y: -6)
//
//            // Progresso no trilho
//            RoundedRectangle(cornerRadius: 10)
//                .fill(LinearGradient(
//                    gradient: Gradient(colors: [Color.blue, Color.purple]),
//                    startPoint: .leading,
//                    endPoint: .trailing
//                ))
//                .frame(width: CGFloat(configuration.value) * 300, height: 8)
//
//            // Thumb (Botão do Slider)
//            Circle()
//                .fill(LinearGradient(
//                    gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.8)]),
//                    startPoint: .top,
//                    endPoint: .bottom
//                ))
//                .frame(width: 30, height: 30)
//                .shadow(color: ColorTheme.lightShadow, radius: 5, x: -3, y: -3)
//                .shadow(color: ColorTheme.darkShadow, radius: 5, x: 3, y: 3)
//                .offset(x: CGFloat(configuration.value) * 270 - 135) // Posição dinâmica
//                .gesture(
//                    DragGesture().onChanged { gesture in
//                        // Atualiza o valor conforme arrasta
//                        let newValue = min(max(0, gesture.location.x / 300), 1)
//                        configuration.onEditingChanged(true)
//                        configuration.value = newValue
//                    }
//                    .onEnded { _ in
//                        configuration.onEditingChanged(false)
//                    }
//                )
//        }
//        .padding(16)
//    }
//}
//
//struct CustomSliderView: View {
//    @State private var sliderValue: Double = 0.5
//
//    var body: some View {
//        VStack {
//            Text("Valor do Slider: \(sliderValue, specifier: "%.2f")")
//                .font(.headline)
//                .foregroundColor(.gray)
//                .padding()
//
//            // Slider usando o estilo customizado
//            Slider(value: $sliderValue, in: 0...1, step: 0.01)
//                .sliderStyle(CustomSliderStyle()) // Aplicando o estilo customizado
//                .frame(width: 300)
//        }
//    }
//}
//
//// Temas de cor para reutilização
//struct ColorTheme {
//    static let background = Color(#colorLiteral(red: 0.92, green: 0.95, blue: 1, alpha: 1))
//    static let darkShadow = Color.black.opacity(0.2)
//    static let lightShadow = Color.white.opacity(0.8)
//}
//
//// Preview para teste
//struct CustomSliderView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomSliderView()
//    }
//}
