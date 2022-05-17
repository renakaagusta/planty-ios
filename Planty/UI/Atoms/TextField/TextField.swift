//
//  TextField.swift
//  Planty
//
//  Created by renaka agusta on 28/04/22.
//

import SwiftUI

struct AppTextField: View {
    @State var placeholder = "Search..."
    @State var text = ""
    @State var image = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                if(image != "") {
                    Image(systemName: "magnifyingglass")
                }
                TextField(placeholder, text: $text).frame(minWidth:0).frame(minWidth: 0, maxWidth: .infinity, minHeight: 16, maxHeight: 16)
            }.padding().background(Color.lightGray).cornerRadius(10)
        }
    }
}

struct AppTextField_Previews: PreviewProvider {
    static var previews: some View {
        AppTextField()
    }
}
