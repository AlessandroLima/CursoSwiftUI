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
    @State private var imageUrl = ""
    @State private var showDetail: Bool = false
    private let columnCount = 2
    private let pageSize = 10
    
    @Namespace private var animation
    

    
    var body: some View {
        
        VStack {
            if showDetail == false {
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: Array(repeating: GridItem(.adaptive(minimum: 400), spacing: 16), count: columnCount), spacing: 16)
                    {
                        ForEach(images, id: \.self) { imageUrl in
                            AsyncImageView(urlString: imageUrl)
                                .frame(maxWidth: .infinity)
                                .onTapGesture {
                                    self.imageUrl = imageUrl
                                    withAnimation(.spring()) {
                                        self.showDetail.toggle()
                                    }
                                    
                                }
                                .matchedGeometryEffect(id: "Image\(imageUrl)", in: animation)
                        }
                        
                        if isLoading {
                            ProgressView()
                                .frame(maxWidth: .infinity)
                                .gridCellColumns(columnCount) // Ocupa toda a largura
                        }
                    }.padding()
                }
            } else {
                AsyncImageView(urlString: imageUrl)
                    .onTapGesture {
                        self.imageUrl = ""
                        withAnimation(.spring()) {
                            self.showDetail.toggle()
                        }
                    }
                    .matchedGeometryEffect(id: "Image\(imageUrl)", in: animation)
            }
            
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
