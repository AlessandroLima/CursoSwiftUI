//
//  ModalsApp.swift
//  Modals
//
//  Created by Alessandro Teixeira Lima on 23/09/24.
//

import SwiftUI

@main
struct ModalsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(flagViewModel: FlagViewModel())
        }
    }
}
