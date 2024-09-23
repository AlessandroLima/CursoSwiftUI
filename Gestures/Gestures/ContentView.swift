//
//  ContentView.swift
//  Gestures
//
//  Created by Alessandro Teixeira Lima on 18/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var tapped: Bool
    @State var cardDragState: CGSize = CGSize.zero
    @State var cardRotateState: Double = 0
    
    var body: some View {
        VStack {
            Card(tapped: self.tapped)
                
                .animation(.spring())
                .offset(y: cardDragState.height)
                .rotationEffect(Angle(degrees: self.cardRotateState))
                .gesture(RotationGesture()
                    .onChanged { value in
                        self.cardRotateState = value.degrees
                    }
                    .onEnded{ value in
                        self.cardRotateState = 0
                    }
                )
                .gesture(DragGesture()
                    .onChanged{ value in
                        self.cardDragState = value.translation
                    }
                    .onEnded{ value in
                        self.cardDragState = CGSize.zero
                    }
                )
                .gesture(TapGesture(count: 1)
                    .onEnded({ () in
                        print("Tapped")
                        self.tapped.toggle()
                    })
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tapped: false)
    }
}
