import SwiftUI

struct CustomSliderView: View {
    @State private var sliderValue: Double = 0.0 // Início em 0%

    var body: some View {
        VStack {
            // Slider customizado
            CustomSlider(value: $sliderValue)
                .frame(height: 40)
                .padding()

            // Exibe o valor em percentual
            Text("\(Int(sliderValue * 100))%")
                .font(.headline)
        }
    }
}

struct CustomSlider: View {
    @Binding var value: Double
    var range: ClosedRange<Double> = 0...1

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Track (fundo do slider)
                Capsule()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 8)

                // Barra preenchida com base no valor
                Capsule()
                    .fill(Color.blue)
                    .frame(width: CGFloat(value) * geometry.size.width, height: 8)

                // Thumb (botão)
                Circle()
                    .fill(Color.blue)
                    .frame(width: 30, height: 30)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 2)
                    )
                    // Posiciona o thumb corretamente no início
                    .offset(x: CGFloat(value) * (geometry.size.width - 30))
                    .gesture(
                        DragGesture()
                            .onChanged { gestureValue in
                                // Calcula o valor com base no arraste
                                let newValue = min(max(0, (gestureValue.location.x - 15) / (geometry.size.width - 30)), 1)
                                self.value = newValue * (range.upperBound - range.lowerBound) + range.lowerBound
                            }
                    )
            }
        }
    }
}

struct CustomSliderView_Previews: PreviewProvider {
    static var previews: some View {
        CustomSliderView()
    }
}
