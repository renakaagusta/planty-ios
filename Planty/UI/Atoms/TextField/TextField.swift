//
//  TextField.swift
//  Planty
//
//  Created by renaka agusta on 28/04/22.
//

import SwiftUI

struct AppTextField: View {
    @State var text = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Spacer()
                Image(systemName: "magnifyingglass")
                TextField("Search...", text: $text).frame(minWidth:0).frame(minWidth: 0, maxWidth: 100, minHeight: 16, maxHeight: 16)
                Spacer()
            }.padding().background(Color.lightGray).cornerRadius(10)
        }
    }
}

struct AppTextField_Previews: PreviewProvider {
    static var previews: some View {
        AppTextField()
    }
}
