//
//  AnnoncesPage.swift
//  AppliProject
//
//  Created by Dewaele Laurine on 03/02/2020.
//  Copyright © 2020 CodeWhitChris. All rights reserved.
//

import SwiftUI
import MapKit

struct NewAnnonce: View {
    
    @State var isFavorite = false
    @State var name : String = ""
    @State var adresse : String = ""
    @State var description : String = ""
    @State var type = PlaceType.allCases
    @State var selectedType: PlaceType = .shareSpace
    @State var date = Date()
    @Binding var showNewAnnonce: Bool

    var body: some View {
        
        
        ScrollView {
            
            VStack {
                
                VStack {
                    Image("NewImage").resizable().aspectRatio(contentMode: .fit).cornerRadius(5).padding(5)
                }
                
                
                VStack(alignment: .leading) {
                    Text("Nom de l'annonce").font(.title).fontWeight(.light).padding([.top, .leading])
                    TextField("Choisissez un nom pour votre annonce", text: $name).textFieldStyle(RoundedBorderTextFieldStyle()).padding(3)
                    Text(" ")
                    Text("Type du lieu")
                        .font(.title).fontWeight(.light).padding([.top, .leading])
                }

                
                VStack(alignment: .leading) {
                    Picker("", selection: $selectedType) {
                        ForEach(type, id: \.self) { type in
                            Text(type.name)
                        }
                    }
                    }.labelsHidden()
            
                
                
                VStack(alignment: .leading) {

                    Text("Description")
                        .font(.title).fontWeight(.light).padding(.leading)
                    
                    TextField("Faites une description de votre lieu", text: $description).textFieldStyle(RoundedBorderTextFieldStyle()).padding(3)
                        
                    Text(" ")
                }

                
                VStack(alignment: .leading) {

                    Text("Adresse").font(.title).fontWeight(.light).padding(.leading)

                    TextField("L'adresse complète de votre lieu", text: $adresse).textFieldStyle(RoundedBorderTextFieldStyle()).padding(3)
                        
                    Text(" ")
                        
                    Text("Disponibilité").font(.title).fontWeight(.light).padding(.leading)
                        Text("Votre lieu est disponible à partir du ...").font(.headline).fontWeight(.light).padding(.leading)

                    DatePicker(selection: $date, in: Date()..., displayedComponents: .date) {
                            Text("")
                        }.labelsHidden().padding(0)
                }

                
                VStack(alignment: .leading) {

                    Text(" ")

                    Button("Publier mon annonce", action: {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "dd/MM/yyyy"
                        let place = Place(id: places.count + 1, name: self.name, type: self.selectedType, picture: "NewImage1", adress: self.adresse, description: self.description, date: dateFormatter.string(from: self.date), userId: 1, location: CLLocationCoordinate2D(latitude: 50.691106, longitude: 3.0754225))
                        places.append(place)
                        
                        self.showNewAnnonce = false
                    }).foregroundColor(Color.white).padding().background(Color("GreenLogo")).cornerRadius(10)
                    
                    Text("")
                }
            }
            
        }.navigationBarTitle("Nouvelle Annonce", displayMode: .inline)
    }
}




struct NewAnnonce_Previews: PreviewProvider {
    @State static var showNewAnnonce = false
    static var previews: some View {
        NewAnnonce(showNewAnnonce: $showNewAnnonce)
    }
}

