//
//  DetailTaskView.swift
//  SwiftUIAndCoordinator
//
//  Created by Alessandro Teixeira Lima on 18/11/24.
//

import SwiftUI

struct DetailTaskView: View {
    @EnvironmentObject private var appCoordinator: AppCoordinatorImpl
    
    let task: Task
    
    var body: some View {
        NavigationStack {
            List {
                Text(task.title)
                    .font(.headline)
                
                Text(task.description)
                    .foregroundStyle(.secondary)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Close") {
                        appCoordinator.dismissSheet()
                    }
                }
            }
        }
    }
}

struct DetailTaskView_Previews: PreviewProvider {
    static var previews: some View {
        DetailTaskView(task: Habit.habitsDummy[0].tasks[0])
    }
}
