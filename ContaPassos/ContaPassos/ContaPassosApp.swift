//
//  ContaPassosApp.swift
//  ContaPassos
//
//  Created by Alessandro Teixeira Lima on 20/10/24.
//

import SwiftUI
import CoreMotion
@main
struct ContaPassosApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(pedometer: CMPedometer())
        }
    }
}
