//
//  PlayerView.swift
//  MusicPlayer
//
//  Created by Alessandro Teixeira Lima on 16/10/24.
//

import SwiftUI

struct PlayerView: View {
    
    
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
            HStack(spacing: 0){
                NeumorphicImageView(width: 300, height: 300)
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
