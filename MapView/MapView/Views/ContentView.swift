//
//  ContentView.swift
//  MapView
//
//  Created by Alessandro Teixeira Lima on 14/10/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @ObservedObject private var locationManager: LocationManager
    @State var search: String = ""
    @State var landmarks = [Landmark]()
    
    init(locationManager: LocationManager = LocationManager()) {
        self.locationManager = locationManager
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            MapView(landmarks: self.landmarks)
            TextField("Search", text: $search, onEditingChanged: { _ in }){
                getNeardByLandmarks()
            }.textFieldStyle(.roundedBorder)
                .padding()
                .offset(y: 44)
        }
    }
}

extension ContentView {
    private func getNeardByLandmarks() {
        guard let location = locationManager.location else { return }
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = self.search
        request.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            
            guard let response = response, error == nil else { return }
            
            let mapItems = response.mapItems
            
            self.landmarks =  mapItems.map {
                Landmark(placemark: $0.placemark)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
