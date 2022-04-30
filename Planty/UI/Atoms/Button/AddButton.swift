//
//  AddButton.swift
//  Planty
//
//  Created by renaka agusta on 28/04/22.
//

import SwiftUI

struct AppAddButton: View {
    @State var height: Double = 40.0
    @State var width: Double = 40.0
    
    var body: some View {
        Button(action: {
           
        }, label: {
            Image(systemName: "plus").resizable().frame(width: 25, height: 25).foregroundColor(.black)
        }).frame(width: width, height: height).padding().background(Color.primaryColor).cornerRadius(40)
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
    }
}

struct AppAddButton_Previews: PreviewProvider {
    static var previews: some View {
        AppAddButton()
    }
}
