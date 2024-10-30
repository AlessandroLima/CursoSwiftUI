//
//  PlaceListViewModel.swift
//  MapView
//
//  Created by Alessandro Teixeira Lima on 29/10/24.
//

import Foundation
import Combine
import MapKit

class PlaceListViewModel: ObservableObject {
    
    private let locationManager: LocationManager
    var cancellable: AnyCancellable?
    @Published var currentLocation: CLLocationCoordinate2D?
    @Published var searchTerm: String = ""
    @Published var landmarks: [LandmarkViewModel] = []
        
    init(locationManager: LocationManager = LocationManager()) {
        self.locationManager = locationManager
        cancellable = locationManager.$location.sink { location in
            if let location = location {
                DispatchQueue.main.async {
                    self.currentLocation = location.coordinate
                }
                
            }
        }
    }
    
    func searchLandmarks(seachTerm: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = seachTerm
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            if let error = error {
                print(error)
            }else if let response = response {
                let mapItems = response.mapItems
                self.landmarks =  mapItems.map {
                    return LandmarkViewModel(placemark: $0.placemark)
                }
            }
        }
    }
    
}
