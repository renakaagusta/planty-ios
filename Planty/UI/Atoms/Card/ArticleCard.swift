//
//  NewsCard.swift
//  Planty
//
//  Created by renaka agusta on 28/04/22.
//

import SwiftUI

struct ArticleCard: View {
    var body: some View {
        VStack{
            Image("Article").resizable()
            VStack{
                HStack{
                    Spacer().frame(width: 10)
                    Text("David Austin, who Breathed Life Into the Rose, Is Dead at 92").font(Font.subheadline.bold())
                    Spacer().frame(width: 10)
                }
                Spacer().frame(height: 15)
                HStack{
                    Spacer().frame(width: 20)
                    Image("Profile").resizable().frame(width: 30, height: 30).cornerRadius(30)
                    HStack{
                        VStack(alignment: .leading){
                            Text("Admin").font(Font.caption.bold())
                            Spacer().frame(height: 5)
                            Text("17 Jan 2021").font(Font.caption2).foregroundColor(.gray)
                        }
                    }
                    Spacer()
                    Image(systemName: "heart")
                    Spacer().frame(width: 20)
                }
                Spacer().frame(height: 5)
            }.frame(width: 300, height: 100)
        }.background(.white).frame(height: 250).cornerRadius(20)
            .shadow(color: .lightGray, radius: 2, x: 0, y: 2)
    }
}

struct ArticleCard_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCard()
    }
}
