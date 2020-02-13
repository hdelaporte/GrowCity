//
//  SwiftUIViewmessagerie.swift
//  exercice03
//
//  Created by Mariama Fofana on 03/02/2020.
//  Copyright © 2020 Mariama Fofana. All rights reserved.


import SwiftUI

struct Messagerie: View {

    var name : String
    var lastName: String
    let userArray = users
    @State private var searchText = ""
    
    var body: some View {
        
        NavigationView {

            VStack{

                // Barre de recherche
                SearchBarView(searchText: $searchText)
                Spacer()

                // Liste des discussions
                List(userArray.filter { $0.firstName.lowercased().contains(searchText.lowercased()) || searchText == "" }) { user in


                    VStack {
                        NavigationLink(destination: ChatView(), label: {
                            discussion(userToDisplay: user, icon: Image(user.picture))
                        })
                    }
                }

            }
            .padding(.bottom)
            .navigationBarTitle("Ma Messagerie")
            .resignKeyboardOnDragGesture()
        }
    }

}
struct discussion: View {
    var userToDisplay : User
    var icon : Image
    var body: some View {
        HStack{
            icon.resizable().aspectRatio(contentMode: .fit)
            .clipShape(Circle()).frame(height: 50)
            Text("\(userToDisplay.firstName) \(userToDisplay.lastName)")

        }
    }

}


struct Messagerie_Previews: PreviewProvider {
    static var previews: some View {
        Messagerie (name: "", lastName: "")
    }
}

//
//Image(user.picture).resizable().aspectRatio(contentMode: .fit)
//    .clipShape(Circle()).frame(height: 200)
