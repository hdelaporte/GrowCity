//
//  LoginPage.swift
//  AppliProject
//
//  Created by Dewaele Laurine on 03/02/2020.
//  Copyright © 2020 CodeWhitChris. All rights reserved.
//

import SwiftUI


struct SignIn: View {
    @State var id = ""
    @State var mdp = ""
    @State var showForgotPassword = false
    @Binding var isConnected: Bool
    @State var isForgotPasswordActive = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                
                Color("GreenLogo").edgesIgnoringSafeArea(.all)
                
                Image("Green Heart Icon Environment Logo").frame(width: 75.0, height: 75).padding(EdgeInsets(top: -15, leading: 0, bottom: 0, trailing: 0))
                
                
                VStack {
                    Spacer()
                    TextField("Identifiant", text: $id).textFieldStyle(RoundedBorderTextFieldStyle()).padding(7)
                    SecureField("Mot de Passe", text: $mdp).textFieldStyle(RoundedBorderTextFieldStyle()).padding(7)
                    
                    Text(" ")
                    Button("     OK     ", action: {
                        Connect().login()
                        self.isConnected = true
                    }).foregroundColor(Color("GreenLogo")).padding(10).background(Color.white).cornerRadius(10)
                    
                   Spacer()
                    
                    NavigationLink(destination: mdpForgot(isActive: $isForgotPasswordActive), isActive: $isForgotPasswordActive) {
                        Text("Mot de passe oublié?").foregroundColor(.white).padding()
                    }
                    
                    NavigationLink(destination: SignUp(isConnected: $isConnected)) {
                        Text("S'incrire ici").foregroundColor(Color("GreenLogo")).padding().background(Color.white).cornerRadius(10)

                    if showForgotPassword {
                        Text("Vérifie ton ID et ton MDP")
                            .padding()
                    }
                    
                    
                }.padding(.horizontal)
                    Text("")
            }
        }
    }
}





struct SignIn_Previews: PreviewProvider {
    @State static var isConnected = false
    static var previews: some View {
        SignIn(isConnected: $isConnected)
    }
}
}

