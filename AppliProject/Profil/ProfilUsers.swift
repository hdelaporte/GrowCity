//
//  profilUsers.swift
//  exercice03
//
//  Created by Mariama Fofana on 06/02/2020.
//  Copyright © 2020 Mariama Fofana. All rights reserved.
//

import SwiftUI

struct ProfilUsers: View {
    
    var user : User
    @State var showingDetail = false
    
    // cette var ci-dessous est la meme que dans "Mes annonces" sauf qu'on ne défini pas le user on attends de le caller  avec la "{"
    var myPlaces: [Place] {
        places.filter { place in place.userId == self.user.id }
    }
    
    var body: some View {
        
        ScrollView {
            
            VStack{
                
                VStack{
                    Image(user.picture).resizable().aspectRatio(contentMode: .fit)
                        .clipShape(Circle()).frame(height: 200)
                    
                    Text("\(user.firstName) \(user.lastName)").font(.title).fontWeight(.light)
                    Text(" ")
                    Text(" ")
                }
                
                
                VStack(alignment: .leading){
                    Text("A propos").font(.title)
                    Text(" ")
                    Text(user.description)
                    Text(" ")
                    Text(" ")
                }
                
                VStack(alignment: .leading){
                    Text("Ses annonces").font(.title)
                
                    ForEach(myPlaces) { place in
                        
                        NavigationLink(destination: AnnonceDetail(place: place)) {

                                PostCell(place: place)

                            }.buttonStyle(PlainButtonStyle())
                }
            }
                
                VStack{
                    Text(" ")
                }
                
                NavigationLink(destination: ChatView()) {
                    Text("Contacter \(user.firstName)")
                    
                }.foregroundColor(Color.white).padding().background(Color("GreenLogo")).cornerRadius(10)
                    Text ("")
                
        }.navigationBarTitle("Profil", displayMode: .inline).padding()
        
    }
}
}


struct ProfilUsers_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfilUsers(user: users[5])
        }
    }
}
