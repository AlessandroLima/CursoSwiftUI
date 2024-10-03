//
//  ContentView.swift
//  AllDevices-W Watch App
//
//  Created by Alessandro Teixeira Lima on 30/09/24.
//

import SwiftUI

struct ContentView: View {
    
    private var animals =  AnimalService.getAll()
    
    var body: some View {
        
        List {
            ForEach(animals, id: \.name) { animal in
                AnimalCell(animal: animal)
            }
        }.listStyle(.carousel)
    }
    
}

struct AnimalCell: View {
    var animal: Animal
    
    var body: some View {
        VStack(alignment: .center) {
            NavigationLink(destination: DetailView(animal: animal)){
            Text(animal.image)
                .font(.custom("Arial", size: 100))
            Text(animal.name)
            }
        }.frame(minWidth: 0, maxWidth: .infinity)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
