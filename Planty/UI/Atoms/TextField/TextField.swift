//
//  TextField.swift
//  Planty
//
//  Created by renaka agusta on 28/04/22.
//

import SwiftUI

struct AppTextField: View {
    @State var placeholder = "Search..."
    @Binding var field: String
    @State var image = ""
    @State var numberInput = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                if(image != "") {
                    Image(systemName: "magnifyingglass")
                }
                TextField(placeholder, text: $field).foregroundColor(Color.black).frame(minWidth:0).frame(minWidth: 0, maxWidth: .infinity, minHeight: 8, maxHeight: 8)
                    .keyboardType(numberInput ? .decimalPad : .default)
            }.padding().background(Color.lightGray).cornerRadius(10)
        }
    }
}

