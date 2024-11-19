//
//  ListHabitView.swift
//  SwiftUIAndCoordinator
//
//  Created by Alessandro Teixeira Lima on 18/11/24.
//

import SwiftUI

struct ListHabitView: View {
    @State private var habits: [Habit] = Habit.habitsDummy
    @EnvironmentObject private var appCoordinator: AppCoordinatorImpl
    
    var body: some View {
        List {
            ForEach(habits) { habit in
                Button {
                    appCoordinator.push(.detailHabit(named: habit))
                } label: {
                    HStack {
                        Text(habit.title)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.secondary)
                    }
                }
                .tint(.primary)
            }
        }
        .navigationTitle("Habit List")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                
                Button {
                    appCoordinator.presentFullScreenCover(.addHabit(onSaveButtonTap: addNewHabit(_:)))
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    private func addNewHabit(_ habit: Habit) {
        habits.append(habit)
    }
}

struct ListHabitView_Previews: PreviewProvider {
    static var previews: some View {
        ListHabitView()
    }
}
