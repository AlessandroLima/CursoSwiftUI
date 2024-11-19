//
//  CoordinatorView.swift
//  SwiftUIAndCoordinator
//
//  Created by Alessandro Teixeira Lima on 18/11/24.
//

import SwiftUI

struct CoordinatorView: View {
    @StateObject var appCoordinator: AppCoordinatorImpl = AppCoordinatorImpl()
    
    var body: some View {
        NavigationStack(path: $appCoordinator.path) {
            appCoordinator.build(.home)
                .navigationDestination(for: Screen.self) { screen in
                    appCoordinator.build(screen)
                }
                .sheet(item: $appCoordinator.sheet) { sheet in
                    appCoordinator.build(sheet)
                }
                .fullScreenCover(item: $appCoordinator.fullScreenCover) { fullScreenCover in
                    appCoordinator.build(fullScreenCover)
                }
        }
        .environmentObject(appCoordinator)
    }
}
