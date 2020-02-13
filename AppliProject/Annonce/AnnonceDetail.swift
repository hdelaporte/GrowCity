//
//  AnnoncesPage.swift
//  AppliProject
//
//  Created by Dewaele Laurine on 03/02/2020.
//  Copyright © 2020 CodeWhitChris. All rights reserved.
//

import SwiftUI

struct AnnonceDetail: View {
    
    let place: Place
    
    var user: User {
        users.first { user in
            place.userId == user.id
            }!
    }
    
    @State var isFavorite = false
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                
                
                
                Image(place.picture).resizable().aspectRatio(contentMode: .fit).frame(height: 300)
                
                Text("Type du lieu")
                    .font(.title).fontWeight(.light).padding([.top, .leading])
                Text(place.type.name)
                    .padding([.top, .leading, .bottom])
                
                
                Text("Description")
                    .font(.title).fontWeight(.light).padding(.leading)
                Text(place.description)
                    .padding()
                
                Text(" ")
                
                Text("Disponibilité")
                    .font(.title).fontWeight(.light).padding(.leading)
                Text("A partir du \(place.date)")
                    .padding([.top, .leading, .bottom])
                
                Spacer()
            }
            
            NavigationLink(destination: ProfilUsers(user: user)) {
                
                VStack(alignment: .leading) {
                    
                    HStack() {
                        
                        Image(user.picture)
                            .resizable().aspectRatio(contentMode: .fit)
                            .clipShape(Circle()).frame(height: 150)
                        
                        Text("\(user.firstName) \(user.lastName)").foregroundColor(.black)
                        Spacer()
                    }.padding()
                        .frame(width: nil)
                }
            }.buttonStyle(PlainButtonStyle())
                
                
                .navigationBarItems(trailing:
                    Button(action: {
                        self.isFavorite.toggle()
                        if self.isFavorite {
                            FavoritePlaces().add(placeId: self.place.id)
                        } else {
                            FavoritePlaces().remove(placeId: self.place.id)
                        }
                    }) {
                        if isFavorite {
                            Image(systemName: "heart.fill").font(.title).foregroundColor(.pink)
                        } else {
                            Image(systemName: "heart").font(.title).foregroundColor(.pink)
                        }
                    }
                    
            ).navigationBarTitle("\(place.name)", displayMode: .inline)
                .onAppear() {
                    self.isFavorite = FavoritePlaces().isPlaceFavorite(id: self.place.id)
            }
            
        }
    }
}

struct AnnonceDetail_Previews: PreviewProvider {
    static var previews: some View {
        AnnonceDetail(place: places[0])
    }
}

