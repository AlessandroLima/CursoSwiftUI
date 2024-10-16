//
//  NeumorphicImageView.swift
//  MusicPlayer
//
//  Created by Alessandro Teixeira Lima on 16/10/24.
//

import SwiftUI

struct NeumorphicImageView: View {
    
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        
        ZStack {
            //ColorTheme.background
            //    .edgesIgnoringSafeArea(.all)
            Image("art")
                .resizable()
                .frame(width: width, height: height)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(ColorTheme.borderColor, lineWidth: 5)
                )
                .padding()
                .shadow(color: ColorTheme.imageGrayShadow, radius: 8, x: 9, y: 9)
                .shadow(color: ColorTheme.imageLightShadow, radius: 8, x: -9, y: -9)
        }
        
    }
}

struct NeumorphicImageView_Previews: PreviewProvider {
    static var previews: some View {
        NeumorphicImageView(width: 300, height: 300)
    }
}
