//
//  MapV2.swift
//  MapView
//
//  Created by Alessandro Teixeira Lima on 29/10/24.
//

import SwiftUI
import MapKit

enum DisplayType {
    case map
    case list
}

struct MapV2: View {
    
    @StateObject private var placeListVM =  PlaceListViewModel()
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var search: String = ""
    @State private var displayType: DisplayType = .map
    
    
    private func getRegion() -> Binding<MKCoordinateRegion> {
        
        guard let coordinate = placeListVM.currentLocation else {
            return .constant(MKCoordinateRegion.defaultRegion)
        }
        
        return .constant(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
    }
    
    var body: some View {
        VStack() {
            
            TextField("Search", text: $search) { _ in
                
            } onCommit: {
                placeListVM.searchLandmarks(seachTerm: search)
            }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                .textFieldStyle(.roundedBorder)
            
            LandmarkCategoryView(placeListVM: placeListVM)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
            
            Picker("Select", selection: $displayType) {
                Text("Mapa").tag(DisplayType.map)
                Text("Lista").tag(DisplayType.list)
            }.pickerStyle(.segmented)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10))
                
            
            switch displayType {
            case .map: Map(coordinateRegion: getRegion(),
                           interactionModes: .all,
                           showsUserLocation: true,
                           userTrackingMode: $userTrackingMode,
                           annotationItems: placeListVM.landmarks) { landmark in
                MapMarker(coordinate: landmark.coordinate)
                
            }.padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
            case .list: LandmarkListView(landmarks: placeListVM.landmarks)
            }
            
        }
    }
}

struct LandmarkListView: View {
    
    let landmarks: [LandmarkViewModel]
    
    var body: some View {
        List(landmarks, id: \.id) { landmark in
            VStack(alignment: .leading , spacing: 10)	{
                Text("\(landmark.name)")
                    .font(.headline)
                Text("\(landmark.placemark.thoroughfare ?? "n/t"), \(landmark.placemark.subThoroughfare ?? "sem número")")
                Text(landmark.placemark.subLocality ?? "sem bairro")
                Text("\(landmark.placemark.locality ?? "") - \(landmark.placemark.administrativeArea ?? "")")
                Text("CEP: \(landmark.placemark.postalCode ?? "sem CEP")")
                
            }
        }.listStyle(.plain)
    }
}

struct MapV2_Previews: PreviewProvider {
    static var previews: some View {
        MapV2()
    }
}
