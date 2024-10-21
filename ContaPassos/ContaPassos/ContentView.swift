//
//  ContentView.swift
//  ContaPassos
//
//  Created by Alessandro Teixeira Lima on 20/10/24.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    
    private let pedometer: CMPedometer
    @State private var steps: Int?
    @State private var distance: Double?
    
    @AppStorage("stepCount", store: UserDefaults(suiteName: "com.aletlima.ContaPassos"))
    var stepCount: Int = 0
    
    private var isPedometerAvaliable: Bool {
        return CMPedometer.isPedometerEventTrackingAvailable() &&
        CMPedometer.isDistanceAvailable() &&
        CMPedometer.isStepCountingAvailable()
    }
    
    private func initializePedometer() {
        if isPedometerAvaliable {
            guard let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date()) else {
                return
            }
            pedometer.queryPedometerData(from: startDate, to: Date()) { data, error in
                guard let data = data, error == nil else { return }
                
                updateUI(data: data)
            }
        }
    }
    
    private func updateUI(data: CMPedometerData){
        steps = data.numberOfSteps.intValue
        stepCount = data.numberOfSteps.intValue
        
        guard let pedometerDistance = data.distance else { return }
        
        let distanceInMeters = Measurement(value: pedometerDistance.doubleValue, unit: UnitLength.meters)
        
        distance = distanceInMeters.converted(to: .miles).value
    }
    
    init(pedometer: CMPedometer) {
        self.pedometer = pedometer
        initializePedometer()
    }
    
    var body: some View {
        VStack {
          
            Text(steps != nil ? "\(steps!) steps" : "").padding()
            Text(distance != nil ? String(format: "%.2f miles",distance!) : "").padding()
                
            Button("Update Steps") {
                stepCount = Int.random(in: 5000...9999)
            }
            
                .onAppear {
                    initializePedometer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(pedometer: CMPedometer())
    }
}
