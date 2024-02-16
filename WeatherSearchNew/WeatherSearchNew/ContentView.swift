//
//  ContentView.swift
//  WeatherSearchNew
//
//  Created by Alessandro Teixeira Lima on 13/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Get Coordinates") {
                Task {
                    let client = GeocodingClient()
                    let weather = WeatherClient()
                    if let location = try await client.coordinateByCity("osasco") {
                        let weather = try await weather.fetchWeather(location: location)
                        print(weather)
                    }
                }
            }
            .padding()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
