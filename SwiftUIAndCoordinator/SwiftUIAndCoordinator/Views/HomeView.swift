//
//  HomeView.swift
//  SwiftUIAndCoordinator
//
//  Created by Alessandro Teixeira Lima on 18/11/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var appCoordinator: AppCoordinatorImpl
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image(systemName: "house")
                .foregroundStyle(.tint)
                .imageScale(.large)
            
            Text("Home")
            
            Spacer()
            
            Button("Go to Habit List") {
                appCoordinator.push(.listHabit)
            }
        }
        .navigationTitle("Home")
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
