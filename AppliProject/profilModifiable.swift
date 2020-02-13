//
//  profilUsers.swift
//  exercice03
//
//  Created by Mariama Fofana on 06/02/2020.
//  Copyright © 2020 Mariama Fofana. All rights reserved.
//

import SwiftUI

struct profilModifiable: View {
    @State var nom = ""
    @State var prenom = ""
    @State var email = ""
    @State var motdepasse = ""
    @State var numerodetelephone = ""
    var body: some View {
            
            NavigationView {
                VStack (alignment:.center){
                    Image("BeauJardin").clipShape(Circle())
                    ZStack {
                        Image(systemName:"pencil")
                        }
                    VStack(alignment: .leading) {
                        Text("Nom")
                            .font(.headline)
                            .padding(3)
                        HStack{
                            TextField("Nom",text: $nom)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }.padding(1)
                        VStack(alignment: .leading){
                            Text("Prénom")
                                .font(.headline)
                                .padding(3)
                            TextField("Prénom",text: $prenom)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }.padding(0)
                        
                        
                        VStack(alignment: .leading){
                            Text("Email")
                                .font(.headline)
                                .padding(3)
                            TextField("Email",text: $email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }.padding(0)
                        
                        VStack(alignment: .leading){
                            Text("Numéro de téléphone")
                                .font(.headline)
                                .padding(3)
                            TextField("Numéro de téléphone",text: $numerodetelephone)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }.padding(0)
                        VStack(alignment: .leading){
                            Text("Mot de passe")
                                .font(.headline)
                                .padding(3)
                            TextField("Mot de passe ",text: $motdepasse)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }.padding(0)
                        
            
                        Text("Description")
                            .font(.headline)
                            .padding(3)
                        Text("Je m'appel Phillipe je suis chef dans un restaurant au centre de Lille, j'aime manger des plats avec du goût et des arômes uniques.")
                        
                    }
                
            }.navigationBarTitle("Mon profil")
            
        }
    }
}

struct profilModifiable_Previews: PreviewProvider {
    static var previews: some View {
        profilModifiable()
    }
}

