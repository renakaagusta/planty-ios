//
//  OutlinedButton.swift
//  Planty
//
//  Created by renaka agusta on 28/04/22.
//

import SwiftUI

struct AppOutlinedButton: View {
    @State var label: String = "Button"
    @State var height: Double = 10.0
    @State var width: Double = 100.0
    
    var body: some View {
        Button(action: {
           
        }, label: {
            Text(label).font(Font.headline.weight(.bold)).foregroundColor(Color.primaryColor).padding()
        }).frame(width: width, height: height).padding().background(Color.white).overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.primaryColor, lineWidth: 1)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
        )
    }
}

struct AppOutlinedButton_Previews: PreviewProvider {
    static var previews: some View {
        AppOutlinedButton(label: "Hello")
    }
}
