//
//  MKCoordinateRegion+Extension.swift
//  MapView
//
//  Created by Alessandro Teixeira Lima on 29/10/24.
//

import Foundation
import MapKit

extension MKCoordinateRegion {
    static var defaultRegion: MKCoordinateRegion {
        return MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -23.5159868, longitude: -46.7774562),
                                  span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }
}
