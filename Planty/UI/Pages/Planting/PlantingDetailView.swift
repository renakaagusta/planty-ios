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
            AsyncImage(url: URL(string: plant.image != "" ? plant.image : "https://kgo.googleusercontent.com/profile_vrt_raw_bytes_1587515358_10512.png")!,
                              placeholder: { Text("Loading ...") },
                       image: { Image(uiImage: $0).resizable() }).frame( width: .infinity, height: 200)
            Text(plant.name)
            Text("Kuantitas")
            Text(String(planting.quantity))
            Text("Umur")
            Text("planting.createdAt")
    }
}

struct PlantingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlantingDetailView()
    }
}
