//
//  ContentView.swift
//  AllDevices
//
//  Created by Alessandro Teixeira Lima on 30/09/24.
//

import SwiftUI

struct ContentView: View {
    
    private var animals =  AnimalService.getAll()
    
    var body: some View {
            NavigationStack {
            VStack {
                        List(animals, id: \.name) { animal in
                            HStack {
                                NavigationLink(destination: SharedDetailView(animal: animal)){
                                    Text(animal.image)
                                        .font(.custom("Arial", size: 100))
                                    
                                    Spacer()
                                    
                                    Text(animal.name)
                                        .font(.largeTitle)
                                }
                        }
                    }
            }.navigationTitle("Animals")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
