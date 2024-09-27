//
//  ContentView.swift
//  APPImageDetector
//
//  Created by Alessandro Teixeira Lima on 27/09/24.
//

import SwiftUI

struct ContentView: View {
    
    let images = ["cat1","dog","tree","mountains"]
    
    var body: some View {
        //VStack{
        //  Text("oi")
        //}
        
        NavigationStack {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(images, id: \.self) {image in
                            ImageView(imageName: image)
                                .padding()
                        }
                    }
                }
            }.navigationBarTitle("Core ML")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.6))
        }.navigationTitle("CoreML")
        
        
    }
}

struct ImageView: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 300, height: 300)
            .cornerRadius(150)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
        ImageView(imageName: "cat1")
    }
}
