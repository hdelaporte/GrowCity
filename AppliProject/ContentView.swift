//
//  ContentView.swift
//  AppliProject
//
//  Created by Dewaele Laurine on 03/02/2020.
//  Copyright © 2020 CodeWhitChris. All rights reserved.
//
//identificationPage
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            
            MapGrowCityView()
                .tabItem {
                    
                    Image(systemName: "mappin.circle")
                    Text("Map")
            }
            
            MonProfil()
                .tabItem {
                    
                    Image(systemName: "person.crop.circle")
                    Text("Profil")
            }
            

            Messagerie(name: "", lastName: "")
                .tabItem {
                    
                    Image(systemName: "envelope")
                    Text("Messagerie")
                    
            }
            
            MesAnnonces()
                .tabItem {
                    
                    Image(systemName: "text.justify")
                    Text("Annonces")
            }
            
            Favoris()
                .tabItem {
                    
                    Image(systemName: "heart")
                    Text("Favoris")
            }
        }.edgesIgnoringSafeArea(.top)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

