//
//  SignIn.swift
//  AppliProject
//
//  Created by Dewaele Laurine on 04/02/2020.
//  Copyright © 2020 CodeWhitChris. All rights reserved.
//

import SwiftUI

struct SignUp: View {
    
    
    @State var ident = ""
    @State var Mdp = ""
    @State var email = ""
    @State var adresse = ""
    @State var ville = ""
    @State var phoneNumber = ""
    @State var name = ""
    @State var surname = ""
    @State var dateDN = ""
    
    @Binding var isConnected: Bool
    
    var body: some View {
        VStack {

            Section {
                TextField("Adresse email", text: $email).textFieldStyle(RoundedBorderTextFieldStyle()).padding(7)
                
                SecureField("Mot de passe", text:$Mdp).textFieldStyle(RoundedBorderTextFieldStyle()).padding(7)
                
                Text("   ")
            
            Button(action: {
                Connect().login()
                self.isConnected = true
            }) {
                HStack {

                Text("   Valider   ").foregroundColor(.white) }.foregroundColor(Color.white).padding().background(Color("GreenLogo")).cornerRadius(10)
                }
            }
        }.navigationBarTitle("S'inscrire", displayMode: .inline)
    }
    }

struct SignUp_Previews: PreviewProvider {
    @State static var isConnected = false
    static var previews: some View {
        NavigationView {
            SignUp(isConnected: $isConnected)
        }
    }
}
