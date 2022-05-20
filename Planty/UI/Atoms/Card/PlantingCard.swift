//
//  PlantingCard.swift
//  Planty
//
//  Created by renaka agusta on 28/04/22.
//

import SwiftUI

struct PlantingCard: View {
    @State var image: String = "Plant"
    @State var title: String = "Nombre Producto"
    @State var age: String = "20"
    @State var createdAt: Date = NSDate() as Date
    @State var quantity: String = "20"

    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Spacer()
                Text(title).font(Font.body.weight(.bold)).foregroundColor(Color.black)
                Spacer().frame(height: 2)
                Text(age + " hari").font(Font.caption).foregroundColor(Color.gray)
                Spacer().frame(height: 2)
                Text(quantity).font(Font.caption2.weight(.bold)).foregroundColor(Color.black)
                Spacer().frame(height: 20)
            }.frame(width: 140, height: 200).background(Color.secondaryColor).cornerRadius(20)
            AsyncImage(url: URL(string: image != "" ? image : "https://kgo.googleusercontent.com/profile_vrt_raw_bytes_1587515358_10512.png")!,
                              placeholder: { Text("Loading ...") },
                              image: { Image(uiImage: $0).resizable() }).frame( width: 110,height: 145).offset(y:-50)
        }.padding().onAppear {
            let timeDifferenceInDays = ((NSDate() as Date - createdAt) as Double)/3600/24 as Double
            age = String(Int(timeDifferenceInDays))
        }
    }
}

struct PlantingCard_Previews: PreviewProvider {
    static var previews: some View {
        PlantingCard()
    }
}
