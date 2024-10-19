//
//  PlayerView.swift
//  MusicPlayer
//
//  Created by Alessandro Teixeira Lima on 16/10/24.
//

import SwiftUI

struct PlayerView: View {
    
    @State private var sliderValue: Double = 1
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack(spacing: 0){
                NeumorphicButtonWithSystemImageView(width: 30, height: 30, systemName: "arrow.left") {
                    print("olá mundo!")
                }
                
                Spacer()
                TitleView(label: "Plaing Now")
                Spacer()
                NeumorphicButtonWithSystemImageView(width: 30, height: 30, systemName: "line.horizontal.3") {
                    print("olá mundo!")
                }
                
            }
            Spacer()
            HStack( spacing: 0){
                NeumorphicImageView(width: 300, height: 300)
            }
            Spacer()
            VStack{
                
                HStack {
                    TitleView(label:  "VOLUME")
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    Spacer()
                    var volumeLabel = String(format: "%.0f", $sliderValue.wrappedValue)
                    TitleView(label:  "\(volumeLabel)%")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                }
                Slider(value: self.$sliderValue, in: 0...100, step: 1)
                    .shadow(color: ColorTheme.darkShadow, radius: 10, x: 6, y: 6)
                    .shadow(color: ColorTheme.lightShadow, radius: 10, x: -6, y: -6)
                    
                    .padding()
                    .tint(ColorTheme.textColor)
            }
            
                
                
            Spacer()
            HStack(spacing: 0){
                NeumorphicButtonWithSystemImageView(width: 30, height: 30, systemName: "backward.fill") {
                    print("olá mundo!")
                }
                Spacer()
                NeumorphicButtonWithSystemImageView(width: 30, height: 30, systemName: "stop.fill") {
                    print("olá mundo!")
                }
                Spacer()
                NeumorphicButtonWithSystemImageView(width: 30, height: 30, systemName: "forward.fill") {
                    print("olá mundo!")
                }
            }
            
        }
        .background(ColorTheme.background)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
