//
//  Favoris.swift
//  AppliProject
//
//  Created by Dewaele Laurine on 07/02/2020.
//  Copyright © 2020 CodeWhitChris. All rights reserved.
//


import SwiftUI

struct Favoris: View {
    @State var places = [Place]()

    var body: some View {
        
        NavigationView {
            
            VStack {
                List(places) { place in
                    NavigationLink(destination: AnnonceDetail(place: place)) {
                        PostCell(place: place)
                    }
                }
            }.padding().navigationBarTitle("Mes Favoris").onAppear {
                self.places = FavoritePlaces().allFavoritesPlaces
            }
            
        }
    }
}




struct Favoris_Previews: PreviewProvider {
    static var previews: some View {
        Favoris()
    }
}
