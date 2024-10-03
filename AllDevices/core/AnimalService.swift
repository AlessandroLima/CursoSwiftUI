//
//  AnimalService.swift
//  AllDevices
//
//  Created by Alessandro Teixeira Lima on 30/09/24.
//

import Foundation

class AnimalService {
    
    static func getAll()-> [Animal] {
        return [Animal(name: "Tiger", description: "This is a tiger", image: "🐆"),
                Animal(name: "Rat", description: "This is a rat", image: "🐀"),
                Animal(name: "Giraffe", description: "This is a giraffe", image: "🦒"),
                Animal(name: "Cat", description: "This is cat", image: "🐈")]
            
    }
}

