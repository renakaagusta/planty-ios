//
//  NewsCard.swift
//  Planty
//
//  Created by renaka agusta on 28/04/22.
//

import SwiftUI

struct PostCard: View {
    
    @State var writer = User()
    @State var post = Post()
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: post.image)!,
                          placeholder: { Text("Loading ...") },
                          image: { Image(uiImage: $0).resizable() })
            VStack{
                HStack{
                    Spacer().frame(width: 2)
                    Text(post.title).font(Font.subheadline.bold())
                    Spacer().frame(width: 2)
                }
                Spacer().frame(height: 15)
                HStack{
                    Spacer().frame(width: 20)
                    AsyncImage(url: URL(string: writer.photo)!,
                                  placeholder: { Text("Loading ...") },
                                  image: { Image(uiImage: $0).resizable() })
                          .frame(width: 30, height: 30).cornerRadius(30)
                    HStack{
                        VStack(alignment: .leading){
                            Text(writer.username).font(Font.caption.bold())
                            Spacer().frame(height: 5)
                        }
                    }
                    Spacer()
                    //Image(systemName: "heart")
                    Spacer().frame(width: 20)
                }
                Spacer().frame(height: 5)
            }.frame(width: 300, height: 100)
        }.frame(height: 250).cornerRadius(20)
            .shadow(color: .lightGray, radius: 2, x: 0, y: 2)
    }
}

struct PostCard_Previews: PreviewProvider {
    static var previews: some View {
        PostCard()
    }
}
