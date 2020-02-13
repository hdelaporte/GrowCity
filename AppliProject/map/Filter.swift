//
//  Filter.swift
//  Grow City
//
//  Created by Hélène Delaporte on 05/02/2020.
//  Copyright © 2020 WeCareAboutEarth. All rights reserved.
//

import SwiftUI

struct Filter: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var enableAirplaneMode = false
    @State private var enableAirplaneMode1 = false
    @State private var enableAirplaneMode2 = false
    @State private var enableAirplaneMode3 = false
    @State private var enableAirplaneMode4 = false
    @State private var enableAirplaneMode5 = false
    @State var availableDate = Date()
    var dataTime = Data()
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                VStack{
                    
                    Form {
                        // SECTION 1
                        Section(header: Text("Type de lieu")) {
                            Toggle(isOn: $enableAirplaneMode) {
                                Text("Espace partagé")
                            }
                            Toggle(isOn: $enableAirplaneMode1) {
                                Text("Espace indépendant")
                            }
                            Toggle(isOn: $enableAirplaneMode2) {
                                Text("Récolte")
                            }
                        }
                        
                        // SECTION 2
                        Section(header: Text("Distance")){
                            Toggle(isOn: $enableAirplaneMode3) {
                                Text("0 km à 1 km")
                            }
                            Toggle(isOn: $enableAirplaneMode4) {
                                Text("1 km à 3 km")
                            }
                            Toggle(isOn: $enableAirplaneMode5) {
                                Text("Plus de 3 km")
                            }
                        }
                        
                        // SECTION 3
                        DatePicker(selection: $availableDate, in: Date()..., displayedComponents: .date) {
                            Text("Disponibilité - à partir du ")
                        }.padding(0)
                    }
                }
                
            }.navigationBarTitle("Filtres").navigationBarItems(trailing: Button("X") {
                self.presentationMode.wrappedValue.dismiss()}.buttonStyle(PlainButtonStyle()).padding())
        }
    }
}
        

struct Filter_Previews: PreviewProvider {
    static var previews: some View {
        Filter()
    }
}
