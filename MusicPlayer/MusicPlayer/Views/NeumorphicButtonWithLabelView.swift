//
//  NeumorphicView.swift
//  MusicPlayer
//
//  Created by Alessandro Teixeira Lima on 16/10/24.
//

import SwiftUI

struct NeumorphicButtonWithLabelView: View {
    
    var width: CGFloat
    var height: CGFloat
    var label: String
    var action: () -> ()
    
    fileprivate func btnWithText() -> some View {
        return Button(self.label) {
            action()
        }
        .frame(width: width, height: height)
        .font(.headline)
        .foregroundColor(ColorTheme.textColor) // Usando cor do tema
        .buttonStyle(NeumorphicPressButtonStyle())
        .padding(ButtonTheme.buttonPadding)
        
    }
    
    var body: some View {
        return ZStack {
            btnWithText()
        }
    }
}

struct NeumorphicButtonWithLabelView_Previews: PreviewProvider {
    
    static var previews: some View {
        NeumorphicButtonWithLabelView(width: 100, height: 100, label: "press") {
            print("oi")
        }
    }
}
