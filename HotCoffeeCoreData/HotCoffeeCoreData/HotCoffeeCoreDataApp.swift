//
//  HotCoffeeCoreDataApp.swift
//  HotCoffeeCoreData
//
//  Created by Alessandro Teixeira Lima on 24/09/24.
//

import SwiftUI

@main
struct HotCoffeeCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
