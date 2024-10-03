//
//  Carroucel.swift
//  CarrocelCachorrinhos
//
//  Created by Alessandro Teixeira Lima on 03/10/24.
//

import SwiftUI

struct CarrocelView: View {
    let images: [String] = [
        "dog 1", // Substitua pelos nomes das suas imagens
        "dog 2",
        "dog 3",
        "dog 4",
        "dog 5",
        "dog 6",
        "dog 7",
        "dog 8",
        "dog 9",
        "dog 10",
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(images, id: \.self) { imageName in
                        GeometryReader { geo in
                            let midX = geo.frame(in: .global).midX
                            let screenMidX = geometry.size.width / 2
                            let scale = max(1, 1.3 - abs(midX - screenMidX) / 200)
                            
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100 * scale, height: 100 * scale)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth:2))
                                //.shadow(radius: 10)
                                .scaleEffect(scale)
                                .animation(.easeInOut, value: scale)
                        }
                        .frame(width: 120, height: 120)
                    }
                }
                .padding()
            }
        }
    }
}

struct CarrocelView_Previews: PreviewProvider {
    static var previews: some View {
        CarrocelView()
    }
}

