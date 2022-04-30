//
//  PlantCard.swift
//  Planty
//
//  Created by renaka agusta on 28/04/22.
//

import SwiftUI

struct PlantCard: View {
    @State var image: String = "Plant"
    @State var title: String = "Nombre Producto"
    @State var category: String = "Nombre Producto"
    @State var quantity: String = "20"

    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Spacer()
                Text(title).font(Font.body.weight(.bold))
                Spacer().frame(height: 2)
                Text(category).font(Font.caption).foregroundColor(Color.gray)
                Spacer().frame(height: 2)
                Text(quantity).font(Font.caption2.weight(.bold))
                Spacer().frame(height: 20)
            }.frame(width: 170, height: 200).background(Color.secondaryColor).cornerRadius(20)
            Image(image).resizable().frame( width: 110,height: 145).offset(y:-50)
        }
    }
}

struct PlantCard_Previews: PreviewProvider {
    static var previews: some View {
        PlantCard()
    }
}
