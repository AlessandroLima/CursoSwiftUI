//
//  miniaturesScroolView.swift
//  ScroolEstiloEnjoei
//
//  Created by Alessandro Teixeira Lima on 01/11/24.
//

import SwiftUI

struct MiniaturesScrollView: View {
    
    var largePhoto: CGFloat
    var topBorder: CGFloat
    var images: [String]
    var spacing: CGFloat = 10
    var groupViews: [any View] = []
    
    fileprivate func largeImage(_ index: Int) -> some View {
        return Image(images[index])
            .resizable()
            .frame(width: largePhoto, height: largePhoto)
            .cornerRadius(12)
    }
    
    fileprivate func smallImage(_ index: Int) -> some View {
        return Image(images[index])
            .resizable()
            .frame(width: (largePhoto / 2) - 5, height: (largePhoto / 2) - 5)
            .cornerRadius(12)
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: self.spacing) { // Espaçamento entre os conjuntos
                ForEach(0..<images.count, id: \.self) { index in
                    if index % 5 == 0 {
                        largeImage(index)
                    } else if index % 5 == 1 && index + 1 < images.count {
                        // Exibe o conjunto de 4 imagens pequenas, usando a próxima imagem do array
                        VStack(spacing: self.spacing) {
                            smallImage(index)
                            smallImage(index + 1)
                        }
                        VStack(spacing: self.spacing) {
                            smallImage(index + 2)
                            smallImage(index + 3)
                        }
                        .frame(width: largePhoto / 2) // Largura fixa para o VStack
                    }
                }
            }
            .padding(EdgeInsets(top: 0, leading: self.spacing, bottom: 0, trailing: 0))
        }
    }
}

struct MiniaturesScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MiniaturesScrollView(largePhoto: 300, topBorder: 20, images: ["imagem1", "imagem2", "imagem3", "imagem4", "imagem5","imagem1", "imagem2", "imagem3", "imagem4", "imagem5"])
    }
}
