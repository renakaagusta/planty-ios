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
    
    var body: some View {
        VStack {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }.navigate(to: PostSelectImageFormView(post: post), when: $moveToPostSelectImageForm)
    }
}

struct PostAddDescriptionFormView_Previews: PreviewProvider {
    static var previews: some View {
        PostAddDescriptionFormView()
    }
}
