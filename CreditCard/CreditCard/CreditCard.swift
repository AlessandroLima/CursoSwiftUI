//
//  ContentView.swift
//  CreditCard
//
//  Created by Alessandro Teixeira Lima on 21/10/24.
//

import SwiftUI

struct CreditCard<Content>: View where Content: View {
    
    var content: () -> Content
    
    var body: some View {
        content()
    }
}

struct CreditCardFront: View {
    
    let name: String
    let expires: String
    
    let gradient = Gradient(colors: [Color(#colorLiteral(red: 0.5481430292, green: 0, blue: 0.4720868468, alpha: 1)), .blue])
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(alignment: .top) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(Color.white)
            
                Spacer()
                
                Text("VISA")
                    .foregroundColor(Color.white)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
            
            }
            
            Spacer()
            
            Text("**** **** **** 2864")
                .foregroundColor(Color.white)
                .font(.system(size: 32))
            
            Spacer()
            
            HStack {
                
                VStack(alignment: .leading) {
                    Text("CARD HOLDER")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                    
                    Text(name)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    
                }
                
                Spacer()
                
                VStack {
                    Text("EXPIRES")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.gray)
                    Text(expires)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
                
            }
            
            
            
        }.frame(width: 300, height: 200)
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5481430292, green: 0, blue: 0.4720868468, alpha: 1)), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(10)
            
    }
}

struct CreditCardBack: View {
    
    let cvv:String
    
    var body: some View {
        VStack {
           
             Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 20)
                .padding([.top])
                
            Spacer()
            
            HStack {
                
                Text(cvv).foregroundColor(Color.black)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0.0, y: 1.0, z: 0.0))
                    .padding(5)
                    .frame(width: 100, height: 20)
                    .background(Color.white)
                
                
                Spacer()
            }.padding()
            
        }.frame(width: 300, height: 200)
            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5481430292, green: 0, blue: 0.4720868468, alpha: 1)), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(10)
    }
}


struct CreditCard_Previews: PreviewProvider {
    static var previews: some View {
        CreditCard<CreditCardFront>(content: {CreditCardFront(name: "Nome", expires: "00/00/00")})
        CreditCardFront(name: "Name", expires: "00/00/00")
        CreditCardBack(cvv: "123")
    }
}
