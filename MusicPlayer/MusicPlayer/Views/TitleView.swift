//
//  TitleView.swift
//  MusicPlayer
//
//  Created by Alessandro Teixeira Lima on 16/10/24.
//

import SwiftUI

struct TitleView: View {
    
    var label: String
    
    var body: some View {
        
        return Text(label.uppercased())
            .font(.custom("Arial", size: 15))
            .fontWeight(.bold)
            .foregroundColor(ColorTheme.textColor)
            
        
    }
}
struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(label: "Plaing Now")
    }
}
