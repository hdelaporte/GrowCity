//
//  ContentView.swift
//  GC_Map
//
//  Created by Hélène Delaporte on 05/02/2020.
//  Copyright © 2020 GrowCity. All rights reserved.
//

import SwiftUI
import MapKit

struct MapGrowCityView: View {
    
    @State private var placesList = places
    @State private var selectedLandmark: LandmarkAnnotation? = nil
    @State private var showingPlaceDetails = false
    @State var name : String = ""
    @State var showFilter : Bool = false
    
    
    var body: some View {
        
        NavigationView {
            
            VStack{
                
                //TextField("Search", text: $name).foregroundColor(.black).padding([.top, .leading, .bottom]).border(Color.gray).padding()
                
                //LocalSearchController()
                
                MapView(landmarks: $placesList,
                        selectedLandmark: $selectedLandmark,
                        showingPlaceDetails: $showingPlaceDetails)
                    .sheet(isPresented: $showFilter) {
                        Filter()
                }
                
                if showingPlaceDetails {
                    NavigationLink(destination: AnnonceDetail(place: selectedLandmark!.place), isActive: $showingPlaceDetails) {
                        EmptyView()
                    }
                }
            }.navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(trailing: Button("Filtres", action : {
                    self.showFilter = true
                }))
            
        }
        
    }
}
struct MapGrowCityView_Previews: PreviewProvider {
    static var previews: some View {
        MapGrowCityView()
    }
}
