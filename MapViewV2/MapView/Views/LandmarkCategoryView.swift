//
//  LandmarkCategoryView.swift
//  MapView
//
//  Created by Alessandro Teixeira Lima on 30/10/24.
//

import SwiftUI

struct LandmarkCategoryView: View {
    
    var placeListVM: PlaceListViewModel
    
    let categories = ["Mercado", "Bar", "Farmácia", "Hospital", "Shopping", "Petshop", "Cinema"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categories, id: \.self) { category in
                    Button {
                        placeListVM.searchLandmarks(seachTerm: category)
                    } label: {
                        Text(category)
                            .font(.custom("Arial", fixedSize: 10))
                    }.buttonStyle(.bordered)
                        .tint(.black)

                }
            }
        }
    }
}

struct LandmarkCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkCategoryView(placeListVM: PlaceListViewModel())
    }
}
