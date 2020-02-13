//
//  Mon profil annonces.swift
//  exercice03
//
//  Created by Mariama Fofana on 05/02/2020.
//  Copyright © 2020 Mariama Fofana. All rights reserved.
//
//
//import SwiftUI
//
//struct ProfilVisite: View {
//
//    var user: User = User(id:2, firstName:"Martine", lastName:"Martin", picture: "Image", email:"s.david@gmail.com", password:"trouver", phone:"07890987", description: "")
//
//    var garden: Array <String> = ["Jardin d'été", "Recoltes"]
//
//    @State var isConnected = Connect().isConnected()
//
//    var body: some View {
////        ZStack {
//            EmptyView()
//            if isConnected {
//                ScrollView {
//                    VStack {
//
//                        Image("Martine").clipShape(Circle())
//                        Text("\(user.firstName) \(user.lastName)")
//
//
//                        HStack {
//                            Text("Mes Annonces")
//                            Spacer()
//                        }.padding()
//                        VStack {
                            //                        PostCell(post: Post(imageName: "ruches", title: "Ruche sur le toit ", city: "Lille"))
                            //                        PostCell(post: Post(imageName: "PicVeg", title: "Jardin partagé", city: "Roubaix"))
                            //                        PostCell(post: Post(imageName: "PicVeg", title: "Recolte", city: "Tourcoing"))
                            
                            
//                            Button("Deconnexion", action: {
//                                Connect().logout()
//                                self.isConnected = false
//                            })
//                        }//.padding()
////                    }
////                }
////            } else {
////                SignIn(isConnected: $isConnected)
////            }
////        }
//    }
//}
//
//struct ProfilVisite_annonces_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfilVisite()
//    }
//}
