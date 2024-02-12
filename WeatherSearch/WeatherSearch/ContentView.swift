//
//  ContentView.swift
//  WeatherSearch
//
//  Created by Alessandro Teixeira Lima on 12/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM =
    WeatherViewModel(weatherService: WeatherService())
    
    var body: some View {
        VStack(alignment: .center){
            TextField("Enter City name", text: self.$weatherVM.cityName) { self.weatherVM.search() }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            
            Text(self.weatherVM.temperature)
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .font(.largeTitle)
            .foregroundStyle(.black)
            .background(.white)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
