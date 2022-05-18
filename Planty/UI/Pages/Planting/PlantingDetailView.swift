//
//  PlantingDetailView.swift
//  Planty
//
//  Created by renaka agusta on 18/05/22.
//

import SwiftUI

struct PlantingDetailView: View {
    
    @State var planting = Planting()
    @State var plant = Plant()
    @State var user = User()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PlantingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlantingDetailView()
    }
}
