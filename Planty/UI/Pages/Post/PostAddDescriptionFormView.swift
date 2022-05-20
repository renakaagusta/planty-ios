//
//  PostAddDescriptionFormView.swift
//  Planty
//
//  Created by renaka agusta on 18/05/22.
//

import SwiftUI

struct PostAddDescriptionFormView: View {
    
    @State var moveToPostSelectImageForm = false
    @State var post = Post()
    @State var title: String = ""
    @State var description: String = ""
    
    var body: some View {
        List {
            Text("Judul").font(Font.body.weight(.bold)).foregroundColor(Color.black)
            AppTextField(field: $title)
            Spacer().frame(height: 10)
            Text("Deskripsi").font(Font.body.weight(.bold)).foregroundColor(Color.black)
            AppTextField(field: $description)
        }.navigationTitle("Postingan baru")
            .toolbar{
                ToolbarItem() {
                        Button("Selanjutnya") {
                            post.title = title
                            post.description = description
                            moveToPostSelectImageForm = true
                        }
                }
            }.background(
                NavigationLink(
                    destination:  PostSelectImageFormView(post: post),
                    isActive: $moveToPostSelectImageForm
                ) {
                    EmptyView()
                }.hidden() // The link is not visible to user
            )
    }
}

struct PostAddDescriptionFormView_Previews: PreviewProvider {
    static var previews: some View {
        PostAddDescriptionFormView()
    }
}
