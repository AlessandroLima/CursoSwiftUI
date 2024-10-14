//
//  ContentView.swift
//  MapView
//
//  Created by Alessandro Teixeira Lima on 14/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var locationManager: LocationManager
    
    init(locationManager: LocationManager = LocationManager()) {
        self.locationManager = locationManager
    }
    
    var body: some View {
        MapView()
    } 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
