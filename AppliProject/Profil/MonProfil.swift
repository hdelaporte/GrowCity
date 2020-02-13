//
//  encoursmariama.swift
//  Grow City
//
//  Created by Hélène Delaporte on 10/02/2020.
//  Copyright © 2020 CodeWhitChris. All rights reserved.
//

import SwiftUI

struct MonProfil: View {
    
    @State var isConnected = Connect().isConnected()
    @State var nom = ""
    @State var prenom = ""
    @State var email = ""
    @State var motdepasse = ""
    @State var numerodetelephone = ""
    @State var description = ""
    var body: some View {
        
        VStack {
            if isConnected {
                
                NavigationView {
                    
                    ScrollView {
                        
                        VStack(alignment: .center) {
                            
                            Image("user1_picture").resizable().aspectRatio(contentMode: .fit).clipShape(Circle()).frame(height: 200)
                            
                            ZStack {
                                
                                Image(systemName:"pencil")
                            }
                            VStack(alignment: .leading){
                                Text("Nom")
                                    .font(.headline)
                                    .padding(3)
                                TextField("Martin",text: $nom)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }.padding(7)
                            
                            VStack(alignment: .leading){
                                Text("Prénom")
                                    .font(.headline)
                                    .padding(3)
                                TextField("Martine",text: $prenom)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }.padding(7)
                            
                            VStack(alignment: .leading){
                                Text("Email")
                                    .font(.headline)
                                    .padding(3)
                                TextField("martine.martin@gmail.com",text: $email)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }.padding(7)
                            
                            VStack(alignment: .leading){
                                Text("Numéro de téléphone")
                                    .font(.headline)
                                    .padding(3)
                                TextField("0150342567",text: $numerodetelephone)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }.padding(7)
                            
                            VStack(alignment: .leading){
                                Text("Mot de passe")
                                    .font(.headline)
                                    .padding(3)
                                TextField("****",text: $motdepasse)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }.padding(7)
                            
                            VStack(alignment: .leading){
                                commentaire()
                            }.padding(0)

                            Button("Déconnexion", action: {
                                Connect().logout()
                                self.isConnected = false
                            }).foregroundColor(Color.white).padding()
                            .background(Color("GreenLogo"))
                            .cornerRadius(10)
                        }
                        
                        
                    }.navigationBarTitle("Mon profil")
                }
                
            } else {
                SignIn(isConnected: $isConnected)
            }
        }
    }
    
}


struct commentaire: View {
    @State var commet = ("Hola chicos, je suis Martine, j'adore jardiner et je vous partagerai mes trucs et astuces avec plaisir, à bientôt")
    var body: some View {
        VStack {
            HStack {
                Text("Description")
                    .font(.headline)
                    .padding(0)
                Spacer()
            }
            
            TextView(text: $commet).frame(height: 60)
               
            Spacer()
            
        }.padding()
        
    }
}


struct TextView: UIViewRepresentable {
    @Binding var text: String
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextView {
        
        let myTextView = UITextView()
        myTextView.delegate = context.coordinator
        myTextView.font = UIFont(name: "HelveticaNeue", size: 15)
        myTextView.isScrollEnabled = true
        myTextView.isEditable = true
        myTextView.isUserInteractionEnabled = true
        myTextView.backgroundColor = UIColor(white: 0.2, alpha: 0.00)
//        myTextView.layer.borderColor = UIColor(gray:2.0)
//       myTextView.layer.borderColor = UIColor(red: 1.0, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        myTextView.layer.borderWidth = 0.3
        myTextView.layer.cornerRadius = 5
        return myTextView
    }
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    class Coordinator : NSObject, UITextViewDelegate {
        
        var parent: TextView
        
        init(_ uiTextView: TextView) {
            self.parent = uiTextView
        }
        
        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }
        
        func textViewDidChange(_ textView: UITextView) {
            print("text now: \(String(describing: textView.text!))")
            self.parent.text = textView.text
        }
    }
}




struct MonProfil_Previews: PreviewProvider {
    static var previews: some View {
        MonProfil()
    }
}
