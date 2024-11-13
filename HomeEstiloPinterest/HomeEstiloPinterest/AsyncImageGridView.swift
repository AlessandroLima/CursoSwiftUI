//
//  AsyncImageGridView.swift
//  HomeEstiloPinterest
//
//  Created by Alessandro Teixeira Lima on 11/11/24.
//

import SwiftUI



struct AsyncImageGridView: View {
    @State private var images: [String] = ListOfImages.urls // URLs das imagens
    @State private var isLoading = false
    private let columnCount = 2
    private let pageSize = 10 // Número de imagens por página
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: columnCount),
                spacing: 5
            ) {
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
        .onAppear {
            loadImages()
        }
        .onScrollToEnd {
            if !isLoading {
                loadMoreImages()
            }
        }
    }
    
    private func loadImages() {
        guard !isLoading else { return }
        isLoading = true
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) { // Simula atraso no carregamento
            let newImages = (1...pageSize).map { "https://via.placeholder.com/300?text=Image\($0)" }
            DispatchQueue.main.async {
                images.append(contentsOf: newImages)
                isLoading = false
            }
        }
    }
    
    private func loadMoreImages() {
        loadImages()
    }
}


struct ScrollViewDetectorModifier: ViewModifier {
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            let maxY = proxy.frame(in: .global).maxY
                            let screenHeight = UIScreen.main.bounds.height
                            if maxY < screenHeight {
                                action()
                            }
                        }
                }
            )
    }
}

extension View {
    func onScrollToEnd(perform action: @escaping () -> Void) -> some View {
        modifier(ScrollViewDetectorModifier(action: action))
    }
}

struct AsyncImageGridView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageGridView()
    }
}
