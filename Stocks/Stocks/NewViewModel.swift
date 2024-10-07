//
//  NewViewModel.swift
//  Stocks
//
//  Created by Alessandro Teixeira Lima on 07/10/24.
//

import Foundation


struct NewViewModel {
    
    let new: New
    
    var title: String { return new.title }
    var publication: String { return new.publication }
    var imageURL: String { return new.imageURL }
}
