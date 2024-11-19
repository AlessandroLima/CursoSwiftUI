//
//  Task.swift
//  SwiftUIAndCoordinator
//
//  Created by Alessandro Teixeira Lima on 18/11/24.
//

import Foundation

struct Task: Identifiable, Hashable, Equatable {
    let id = UUID()
    let title: String
    let description: String
}

