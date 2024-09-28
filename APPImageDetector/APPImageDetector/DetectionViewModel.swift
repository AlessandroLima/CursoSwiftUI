//
//  DetectionViewModel.swift
//  APPImageDetector
//
//  Created by Alessandro Teixeira Lima on 27/09/24.
//

import Foundation
import SwiftUI
import CoreML
import UIKit

class DetectionViewModel: ObservableObject {
    
    var name: String = ""
    var manager: DetectionManager
    @Published var predictionLabel: String = ""
    
    init(manager: DetectionManager) {
        self.manager = manager
    }
    
    func detect (image: String) {
        let sourceImage = UIImage(named: image)
        
        guard let resizedImage =  sourceImage?.resizeImage(targetSize: CGSize(width: 224, height: 224)) else {
            fatalError("Error to resize...")
        }
        
        if let label = manager.detect(resizedImage){
            predictionLabel = label
        }
        
    }
}

class DetectionManager {
    let model = Resnet50()
    
    func detect(_ img: UIImage) -> String? {
        guard let pixelBuffer = img.toCVPixelBuffer(),
              let predection = try? model.prediction(image: pixelBuffer) else {
            return nil
        }
        
        return predection.classLabel
    }
    
}
