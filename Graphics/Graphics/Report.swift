//
//  Report.swift
//  Graphics
//
//  Created by Alessandro Teixeira Lima on 18/09/24.
//

import Foundation

struct Report: Hashable {
    
    let year: String
    let revenue: Double
    
}

extension Report {
    static func all() -> [Report] {
        let all = [
            Report(year: "2022", revenue: 2500),
            Report(year: "2023", revenue: 8500),
            Report(year: "2024", revenue: 6300),
            Report(year: "2025", revenue: 2700)
        ]
        return all
    }
    
}
