//
//  ContentView.swift
//  Modals
//
//  Created by Alessandro Teixeira Lima on 23/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var country: String = ""
    let flags = ["🇦🇽","🇩🇿","🇵🇰","🇺🇸","🇹🇷","🇧🇷"]
    
    @State var flagViewModel: FlagViewModel
 
    var body: some View {
        
        List {
            Text(country)
            ForEach(self.flags, id: \.self) { flag in
                HStack {
                    Text(flag)
                        .font(.custom("Arial", size: 50))
                }.onTapGesture {
                    self.flagViewModel.flag = flag
                    self.flagViewModel.showModal.toggle()
                }
            }
        }.sheet(isPresented: self.$flagViewModel.showModal) {
            FlagDetailView(flag: self.flagViewModel.flag,
                           country: self.$country,
                           showModal: self.$flagViewModel.showModal)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(flagViewModel: FlagViewModel())
    }
}
