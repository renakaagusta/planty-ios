//
//  MinusButton.swift
//  Planty
//
//  Created by renaka agusta on 28/04/22.
//

import SwiftUI

struct AppMinusButton: View {
    @State var height: Double = 40.0
    @State var width: Double = 40.0
    
    var body: some View {
        Button(action: {
           
        }, label: {
            Image(systemName: "minus").resizable().frame(width: 30, height: 5).foregroundColor(.black)
        }).frame(width: width, height: height).padding().background(Color.white).overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.black, lineWidth: 1)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
        )
    }
}

struct AppMinusButton_Previews: PreviewProvider {
    static var previews: some View {
        AppMinusButton()
    }
}
