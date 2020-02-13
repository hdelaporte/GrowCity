//
//  mdpForgot.swift
//  AppliProject
//
//  Created by Dewaele Laurine on 04/02/2020.
//  Copyright © 2020 CodeWhitChris. All rights reserved.
//

import SwiftUI

struct mdpForgot: View {
    
    @State var adm = ""
    @Binding var isActive: Bool

    var mail = "Un mail vous attend pour modifier votre mot de passe 😁"
    
    
    var body: some View {
        
        VStack {
            
            TextField("Entre ton adresse email", text: $adm).textFieldStyle(RoundedBorderTextFieldStyle()).padding(7)
            
            Button("Valider", action: {
                self.isActive = false
                }).foregroundColor(Color.white).padding().background(Color("GreenLogo")).cornerRadius(10)
            
        }.navigationBarTitle("Mot de passe oublié ?", displayMode: .inline)
    }
}

struct mdpForgot_Previews: PreviewProvider {
    @State static var isActive = true
    static var previews: some View {
        NavigationView {
            mdpForgot(isActive: $isActive)
        }
    }
}
