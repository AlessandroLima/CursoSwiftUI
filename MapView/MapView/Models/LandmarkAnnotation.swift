//
//  LandmarkAnnotation.swift
//  MapView
//
//  Created by Alessandro Teixeira Lima on 15/10/24.
//

import Foundation
import MapKit

final class LandmarkAnnotation: NSObject, MKAnnotation {
    
    let coordinate: CLLocationCoordinate2D
    let title: String?
    
    init(landmark: Landmark) {
        self.coordinate = landmark.coordinate
        self.title = landmark.title
    }
    
    
}
