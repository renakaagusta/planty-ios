//
//  PlantCard.swift
//  Planty
//
//  Created by renaka agusta on 18/05/22.
//

import SwiftUI


struct PlantCard: View {
    @State var image: String = "Plant"
    @State var title: String = "Nombre Producto"
    @State var temperature: String = ""
    @State var humidity: String = ""
    @State var selected: Bool = false

    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Text(title).font(Font.body.weight(.bold)).foregroundColor(Color.black)
                Spacer().frame(height: 2)
                Text(temperature).font(Font.caption2.weight(.bold)).foregroundColor(Color.black)
                Spacer().frame(height: 2)
                Text(humidity).font(Font.caption2.weight(.bold)).foregroundColor(Color.black)
                Spacer().frame(height: 20)
            }.frame(width: 170, height: 200).background(selected == false ? Color.secondaryColor : Color.primaryColor).cornerRadius(20)
            AsyncImage(url: URL(string: image)!,
                              placeholder: { Text("Loading ...") },
                              image: { Image(uiImage: $0).resizable() }).frame( width: 110,height: 145).offset(y:-50)
        }
    }
}

struct PlantCard_Previews: PreviewProvider {
    static var previews: some View {
        PlantCard()
    }
}

