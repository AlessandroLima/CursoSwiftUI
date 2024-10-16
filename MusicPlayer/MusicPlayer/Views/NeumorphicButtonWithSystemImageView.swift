//
//  NeumorphicButtonWithSystemImageView.swift
//  MusicPlayer
//
//  Created by Alessandro Teixeira Lima on 16/10/24.
//

import Foundation
import SwiftUI


struct NeumorphicButtonWithSystemImageView: View {
    
    var width: CGFloat
    var height: CGFloat
    var systemName: String
    var action: () -> ()
    
    fileprivate func btnWithImageSystem() -> some View {
        return Button(action: {
           action()
        }) {
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .frame(width: width / 2, height: height / 2)
                .foregroundColor(.gray)
        }
        .frame(width: width, height: height)
        .buttonStyle(NeumorphicPressButtonStyle())
        .padding(ButtonTheme.buttonPadding)
    }
    
    var body: some View {
        return ZStack {
            btnWithImageSystem()
        }
    }
}

struct NeumorphicButtonWithSystemImageView_Previews: PreviewProvider {
    
    static var previews: some View {
        NeumorphicButtonWithSystemImageView(width: 30, height: 30, systemName: "line.horizontal.3") {
            print("olá mundo!")
        }
    }
}



