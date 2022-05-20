//
//  PlantDetailView.swift
//  Planty
//
//  Created by renaka agusta on 18/05/22.
//

import SwiftUI

struct PlantDetailView: View {
    @State var plant: Plant = Plant()
    
    var body: some View {
        List{
            VStack(alignment: .center) {
                AsyncImage(url: URL(string: plant.image != "" ? plant.image : "https://kgo.googleusercontent.com/profile_vrt_raw_bytes_1587515358_10512.png")!,
                           placeholder: { Text("Loading ...") },
                           image: { Image(uiImage: $0).resizable() }).frame( width: 120, height: 200)
                Spacer().frame(height: 15)
            }
            VStack(alignment: .leading) {
                Text(plant.name).font(Font.title.weight(.bold))
                Spacer().frame(height: 5)
                Text("Suhu").font(Font.title3.weight(.bold))
                Text(plant.temperature)
                Spacer().frame(height: 12)
                Text("Kelembapan").font(Font.title3.weight(.bold))
                Spacer().frame(height: 5)
                Text(plant.humidity)
                VStack {
                    Spacer().frame(height: 12)
                    Text("Deskripsi").font(Font.title3.weight(.bold))
                    Spacer().frame(height: 5)
                    Text(plant.description)
                }
            }
        }.navigationTitle("Tanaman")
    }
}

struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetailView()
    }
}
