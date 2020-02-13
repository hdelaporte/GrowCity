//
//  Mes Annonces.swift
//  Grow City
//
//  Created by Hélène Delaporte on 03/02/2020.
//  Copyright © 2020 WeCareAboutEarth. All rights reserved.
//

import SwiftUI

struct MesAnnonces: View {
    
    @State var myPlaces: [Place] = places.filter { place in place.userId == users[0].id }
    @State var showNewAnnonce : Bool = false
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                ForEach(myPlaces) { place in
                    NavigationLink(destination: AnnonceDetail(place: place)) {
                        
                        PostCell(place: place)
                        
                    }.buttonStyle(PlainButtonStyle())
                    
                }.sheet(isPresented: $showNewAnnonce, onDismiss: {
                    self.myPlaces = places.filter { place in place.userId == users[0].id }
                }) {
                    NewAnnonce(showNewAnnonce: self.$showNewAnnonce)
                }
                .navigationBarTitle("Mes Annonces")
                .navigationBarItems(trailing:

                    Button(action: {
                        self.showNewAnnonce = true
                    }) {
                        Image(systemName: "plus.circle").padding().frame(width: 50.0)
                    }

                )
            }
        }
        
    }
}

struct MesAnnonces_Previews: PreviewProvider {
    static var previews: some View {
        MesAnnonces()
    }
    
}

