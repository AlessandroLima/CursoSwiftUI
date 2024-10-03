//
//  ContentView.swift
//  AllDevices-MacOS
//
//  Created by Alessandro Teixeira Lima on 30/09/24.
//

import SwiftUI

struct ContentView: View {
    
    private var animals =  AnimalService.getAll()
    @State private var selectedAnimal: Animal = Animal(name: "", description: "", image: "")
    
    var body: some View {
        
        NavigationView{
            
            
            AnimalList(animals: animals, selectedAnimal: $selectedAnimal)
            SharedDetailView(animal: self.selectedAnimal)
            
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
            
    }
    
}


struct AnimalList: View {
    
    var animals: [Animal]
    @Binding var selectedAnimal: Animal
    
    var body: some View {
        List(animals, id: \.name) { animal in
            VStack {
                Text(animal.image)
                    .font(.custom( "Arial", size: 200))
                Text(animal.name)
            }.onTapGesture {
                selectedAnimal = animal
            }
        }.frame(width: 250)
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
