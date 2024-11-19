//
//  DetailHabitView.swift
//  SwiftUIAndCoordinator
//
//  Created by Alessandro Teixeira Lima on 18/11/24.
//

import SwiftUI

import SwiftUI

struct DetailHabitView: View {
    @EnvironmentObject var appCoordinator: AppCoordinatorImpl
    
    let habit: Habit
    
    var body: some View {
        VStack {
            List(habit.tasks) { task in
                Button {
                    appCoordinator.presentSheet(.detailTask(named: task))
                } label: {
                    Text(task.title)
                }
            }
        }
        .navigationTitle(habit.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Home") {
                    appCoordinator.popToRoot()
                }
            }
        }
    }
}


struct DetailHabitView_Previews: PreviewProvider {
    static var previews: some View {
        DetailHabitView(habit: Habit.habitsDummy[0])
    }
}
