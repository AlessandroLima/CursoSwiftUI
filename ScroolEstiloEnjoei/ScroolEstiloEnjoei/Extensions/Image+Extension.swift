//
//  Image+Extension.swift
//  ScroolEstiloEnjoei
//
//  Created by Alessandro Teixeira Lima on 01/11/24.
//

import Foundation
import SwiftUI
extension Image {
    func customImage(width: CGFloat, height: CGFloat) -> some View {
        self
            .resizable()
            .frame(width: width, height: height)
            .cornerRadius(12)
    }
}
