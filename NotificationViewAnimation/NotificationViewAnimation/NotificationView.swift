//
//  NotificationView.swift
//  NotificationViewAnimation
//
//  Created by Alessandro Teixeira Lima on 02/10/24.
//

import SwiftUI

struct NotificationView: View {
    
    private let screenHeight = UIScreen.main.bounds.height
    var notificationHeight: CGFloat
    private let notificationWidth: CGFloat = UIScreen.main.bounds.width - 40
    
    var body: some View {
        VStack{
            //            Button {
            //                } label: {
            //                    Text("Success")
            //                        .font(.custom("Arial", size: 30))
            //                        .padding(.horizontal, 8)
            //                        .frame(width: notificationWidth, height: notificationHeight)
            //                        .foregroundColor(.white)
            //                        .background(.green)
            //                        .cornerRadius(16)
            //                }
            
            
            Text("Success")
                .font(.custom("Arial", size: 30))
                .padding()
                .foregroundColor(Color.white)
                .frame(width: notificationWidth, height: notificationHeight)
                .background(Color.green)
                .cornerRadius(20)
            
            
            
        }
        
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(notificationHeight: 80)
    }
}
