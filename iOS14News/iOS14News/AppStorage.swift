//
//  AppStorage.swift
//  iOS14News
//
//  Created by Alessandro Teixeira Lima on 17/10/24.
//

import SwiftUI

struct Storage: View {
    
    @AppStorage("isDarkMode")
    private var isDarkMode: Bool = false
    
    var body: some View {
        VStack {
            Text(isDarkMode ? "Dark Mode" : "Light Mode")
            
            Toggle(isOn: $isDarkMode) {
                Text("Select Mode")
            }.fixedSize()
        }
    }
}

struct AppStorage_Previews: PreviewProvider {
    static var previews: some View {
        Storage()
    }
}
