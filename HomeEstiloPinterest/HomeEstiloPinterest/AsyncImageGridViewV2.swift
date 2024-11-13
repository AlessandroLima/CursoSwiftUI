//
//  AsyncImageGridViewV2.swift
//  HomeEstiloPinterest
//
//  Created by Alessandro Teixeira Lima on 12/11/24.
//

import SwiftUI

struct AsyncImageGridViewV2: View {
    
    @State private var images: [String] = ListOfImages.urls // URLs das imagens
    @State private var isLoading = false
    private let columnCount = 2
    private let pageSize = 10 // Número de imagens por página
    

    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: Array(repeating: GridItem(.adaptive(minimum: 400), spacing: 16), count: columnCount), spacing: 16)
            {
                ForEach(images, id: \.self) { imageUrl in
                    AsyncImageView(urlString: imageUrl)
                        .frame(maxWidth: .infinity)
                }
                
                if isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity)
                        .gridCellColumns(columnCount) // Ocupa toda a largura
                }
            }.padding()
        }
    }
}

private func fetchImages() {
    
}

struct AsyncImageGridViewV2_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageGridViewV2().preferredColorScheme(.dark)
    }
}
