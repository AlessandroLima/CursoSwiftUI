//
//  Landmark.swift
//  MapView
//
//  Created by Alessandro Teixeira Lima on 15/10/24.
//

import Foundation
import MapKit

struct Landmark: Hashable {
    let placemark: MKPlacemark
    
    var id: UUID {
        UUID()
    }
    
    var name: String {
        placemark.name ?? ""
    }
    
    var title: String {
        placemark.name ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D {
        self.placemark.coordinate
    }
}
