//
//  ContentView.swift
//  Forms
//
//  Created by Alessandro Teixeira Lima on 23/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scheduled: Bool = false
    @State private var enabled: Bool = false
    @State private var colorTemperature: Float = 0
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Lorem ipsum dolor sit amet consectetur adipiscing elit massa luctus augue, leo ac integer tortor litora quis pretium per felis id est.").padding()) {
                    Toggle(isOn: $scheduled) {
                        Text("Scheduled")
                    }
                    HStack {
                        VStack(alignment: .leading){
                            Text("From")
                            Text("to")
                        }
                        Spacer()
                        
                        NavigationLink(destination: Text("Scheduled Settings")) {
                            VStack(alignment: .trailing){
                                Text("Sunset").foregroundColor(.blue)
                                Text("Sunrise").foregroundColor(.blue)
                            }
                        }.fixedSize()
                        
                    }
                }
                Section {
                    Toggle(isOn: $enabled) {
                        Text("Manual enable until tomorow")
                    }
                }
                Section(header: Text("Color Temperature")){
                    HStack {
                        Text("Less Arm")
                        Spacer()
                        Text("More Arm")
                    }
                    VStack {
                        Slider(value: $colorTemperature)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
