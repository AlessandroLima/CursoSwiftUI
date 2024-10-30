//
//  PlaceListView.swift
//  MapView
//
//  Created by Alessandro Teixeira Lima on 15/10/24.
//

import SwiftUI
import MapKit

struct PlaceListView: View {
    
    let landmarks: [LandmarkViewModel]
    var onTap: () -> ()
    
    var body: some View {
        
        VStack(spacing: 0)  {
            
            HStack{
                Text("Locais")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                Spacer()
            }.frame(height: 60)
                .background(.gray)
                .gesture(TapGesture().onEnded(self.onTap))
            
            List(landmarks, id: \.id) { landmarmk in
                Text(landmarmk.name)
            }.listStyle(.plain)
            
        }.cornerRadius(20)
        
        
    }
}

struct PlaceListView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceListView(landmarks: [LandmarkViewModel(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude:  -23.5159868, longitude: -46.7774562)))], onTap: {})
    }
}
