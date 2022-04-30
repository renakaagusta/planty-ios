//
//  FlatButton.swift
//  Planty
//
//  Created by renaka agusta on 28/04/22.
//

import SwiftUI

struct AppFlatButton: View {
    @State var label: String = "Button"
    @State var height: Double = 10.0
    @State var width: Double = 100.0
    
    var body: some View {
        Button(action: {
           
        }, label: {
            Text(label).font(Font.headline.weight(.bold)).foregroundColor(Color.black).padding()
        }).frame(width: width, height: height).padding().background(Color.white).cornerRadius(10)
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
    
    }
}

struct AppFlatButton_Previews: PreviewProvider {
    static var previews: some View {
        AppFlatButton(label: "Hello")
    }
}
