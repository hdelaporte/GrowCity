//
//  PostCell.swift
//  AppliProject
//
//  Created by Dewaele Laurine on 05/02/2020.
//  Copyright © 2020 CodeWhitChris. All rights reserved.
//

import SwiftUI

struct PostCellold: View {

    var place : Place

    var body: some View {

        HStack(alignment: .top) {

            Image(place.picture).renderingMode(.original)
                .resizable()
                .frame(width: 150, height: 150)

            VStack {
                Text(place.name)
                    .padding([.top, .leading]).foregroundColor(.primary)
                Spacer().frame(height: 50)
                
                HStack {
                    Image(systemName: "pin")
                        .padding([.top, .leading]).foregroundColor(.primary)
                    Text(place.adress)
                        .padding(.top).foregroundColor(.primary)
                }
            }
        }
    }
}
//
struct PostCellold_Previews: PreviewProvider {
    static var previews: some View {

        PostCellold(place: places[0])

    }
}

