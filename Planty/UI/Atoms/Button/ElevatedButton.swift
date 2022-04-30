//
//  ElevatedButton.swift
//  Planty
//
//  Created by renaka agusta on 28/04/22.
//

import SwiftUI

struct AppElevatedButton: View {
    @State var label: String = "Button"
    @State var height: Double = 10.0
    @State var width: Double = 100.0
    
    var body: some View {
        Button(action: {
           
        }, label: {
            Text(label).font(Font.headline.weight(.bold)).foregroundColor(Color.white).padding()
        }).frame(width: width, height: height).padding().background(Color.primaryColor).cornerRadius(10)
            .shadow(color: .gray, radius: 2, x: 0, y: 2)
    }
}

struct AppElevatedButton_Previews: PreviewProvider {
    static var previews: some View {
        AppElevatedButton(label: "Hello")
    }
}
