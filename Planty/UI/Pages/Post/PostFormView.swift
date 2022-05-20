//
//  PostFormView.swift
//  Planty
//
//  Created by renaka agusta on 13/05/22.
//

import SwiftUI
import TextEditor

struct PostFormView: View {
    
    @State var mutableContent = NSMutableAttributedString()
    @State var content = ""
    @State var moveToPostAddDescriptionForm = false
    @State var post = Post()
    
    var body: some View {
            VStack(spacing: 0) {
                RichTextEditor(richText: mutableContent){ newContent in
                    content = newContent.string
                }.frame(width: .infinity, height: .infinity)
                .padding(10)
                .background(
                    Rectangle()
                        .stroke(lineWidth: 1)
                )
    }.frame(width: .infinity, height: .infinity).navigationTitle("Postingan baru")
            .toolbar{
                ToolbarItem() {
                        Button("Selanjutnya") {
                            post.content = content
                            moveToPostAddDescriptionForm = true
                        }
                }
            }.background(
                NavigationLink(
                    destination:  PostAddDescriptionFormView(),
                    isActive: $moveToPostAddDescriptionForm
                ) {
                    EmptyView()
                }.hidden() // The link is not visible to user
            )
    }
}

struct PostFormView_Previews: PreviewProvider {
    static var previews: some View {
        PostFormView()
    }
}
