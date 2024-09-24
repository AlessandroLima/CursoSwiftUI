//
//  FlagDetailView.swift
//  Modals
//
//  Created by Alessandro Teixeira Lima on 24/09/24.
//

import Foundation
import SwiftUI

struct FlagDetailView: View {
    var flag: String
    @Binding var country: String
    @Binding var showModal: Bool
    
    var body: some View {
        VStack{
            Text(flag)
                .font(.custom("Arial", size: 300))
            Section {
                TextField("Enter country name", text: $country)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                Button("Submit") {
                    showModal.toggle()
                }
            }
            
        }
    }
}

#if DEBUG
struct FlagDetailViewPreviews: PreviewProvider {
    static var previews: some View {
        FlagDetailView(flag: "🇦🇽", country: .constant("USA"), showModal: .constant(false))
    }
}
#endif
