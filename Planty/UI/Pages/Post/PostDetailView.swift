//
//  PostDetailView.swift
//  Planty
//
//  Created by renaka agusta on 18/05/22.
//

import SwiftUI

struct PostDetailView: View {
    
    @State var post: Post = Post()
    @State var writer: User = User()
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: post.image != "" ? post.image : "https://kgo.googleusercontent.com/profile_vrt_raw_bytes_1587515358_10512.png")!,
                              placeholder: { Text("Loading ...") },
                       image: { Image(uiImage: $0).resizable() }).frame( width: .infinity, height: 200)
            Text(post.title).padding()
            HStack{
                Spacer().frame(width: 5)
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
                Spacer().frame(width: 5)
            }
            WebView(text: post.content).padding()
        }.onAppear{
            print(post.content)
        }.navigationTitle("Postingan")
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView()
    }
}
