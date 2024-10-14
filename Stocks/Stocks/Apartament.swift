//
//  Apartament.swift
//  Stocks
//
//  Created by Alessandro Teixeira Lima on 11/10/24.
//

import Foundation

class Apartament {
    var number: Int
    weak var tenant: Tenant? // Usamos weak para evitar a retenção cíclica
    init(number: Int) {
        self.number = number
    }
    
    deinit {
        print("Apartamento \(number) saiu da memória")
    }
}

class Tenant {
    var name: String
    weak var apartment: Apartament?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Inquilino \(name) saiu da memória")
    }
}

var apt: Apartament? = Apartament(number: 101)
var tenant: Tenant? = Tenant(name: "John")
