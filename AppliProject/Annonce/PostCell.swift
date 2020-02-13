//
//  PostCellNew.swift
//  Grow City
//
//  Created by Hélène Delaporte on 11/02/2020.
//  Copyright © 2020 CodeWhitChris. All rights reserved.
//

import SwiftUI

struct PostCell: View {

    var place : Place

    var body: some View {

        VStack {

                HStack {
                    Image(place.picture).resizable().aspectRatio(contentMode: .fit).cornerRadius(5)
                        .frame(width: 180, height: 150)
                    
                    VStack(alignment: .leading) {
                        Text(place.name).font(.headline)
                        Text(" ")
                        Text(place.adress).foregroundColor(.gray)
                    }
                }
                }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {

        PostCell(place: places[0])

    }
}
