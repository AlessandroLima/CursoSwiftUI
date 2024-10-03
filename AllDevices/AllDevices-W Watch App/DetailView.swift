//
//  DetailView.swift
//  AllDevices-W Watch App
//
//  Created by Alessandro Teixeira Lima on 30/09/24.
//

import SwiftUI

struct DetailView: View {
    
    var animal: Animal
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(animal.image).font(.custom("Arial", size: 300))
                Text(animal.description).font(.largeTitle)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(animal: Animal(name: "Tiger", description: "This is a tiger", image: "🐆"))
    }
}
