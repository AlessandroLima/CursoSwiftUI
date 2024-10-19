//
//  ContentView.swift
//  iOS14News
//
//  Created by Alessandro Teixeira Lima on 17/10/24.
//

import SwiftUI

class Counter: ObservableObject {
    @Published var value: Int = 0
}

struct CounterView: View {
    
    //@ObservedObject var counter = Counter()
    //O Observed object zera quando a view é alterada como o contador da view principal
    @StateObject var counter = Counter()
    
    var body: some View {
        VStack {
            VStack {
                Text("\(counter.value)")
                
                Button ("Counter increment") {
                    counter.value += 1
                }
            }.padding(10)
                .background(.green)
            
        }
        .padding()
    }
}

struct StateObjectExempleView : View {
    
    @State private var count: Int = 0
    
    var body: some View {
        VStack {
            Text("Content View")
            
            Text("\(count)")
            
            Button ("ContentView Count increment") {
                count += 1
            }
            
            CounterView()
        }
        .padding()
        .background(.yellow)
    }
}

struct StateObjectExempleView_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectExempleView()
    }
}
