//
//  AsyncImageView.swift
//  HomeEstiloPinterest
//
//  Created by Alessandro Teixeira Lima on 12/11/24.
//

import Foundation
import SwiftUI

struct AsyncImageView: View {
    let urlString: String
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            default:
                ProgressView()
            }
        }
    }
}

