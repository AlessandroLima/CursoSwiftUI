//
//  ContentView.swift
//  APPImageDetector
//
//  Created by Alessandro Teixeira Lima on 27/09/24.
//

import SwiftUI
import Combine

struct Detection: View {
    
    let images = ["cat1","dog","tree","mountains"]
    
    @State var imageName: String = ""
    private var manager: DetectionManager
    @ObservedObject private var dvm: DetectionViewModel
    
    init(manager: DetectionManager) {
        self.manager = manager
        self.dvm = DetectionViewModel(manager: manager)
    }
    
    var body: some View {
       
        NavigationStack {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(images, id: \.self) {image in
                            VStack {
                                ImageView(imageName: image)
                                    .onTapGesture {
                                        dvm.detect(image: image)
                                        imageName = dvm.predictionLabel
                                    }
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
                
                VStack{
                    Text(imageName)
                        .font(.custom("Arial", size: 30))
                        .frame(height: 30)
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
            .frame(width: 224, height: 224)
            .cornerRadius(150)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Detection(manager: DetectionManager())
        ImageView(imageName: "cat1")
    }
}
