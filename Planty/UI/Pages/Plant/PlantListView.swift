//
//  PlantListView.swift
//  Planty
//
//  Created by renaka agusta on 08/05/22.
//

import SwiftUI
import CloudKit

struct PlantListView: View {
    @State var plantList: [Plant] = []
    @State var filteredPlantList: [Plant] = []
    @State var user: User = User()
    @State var searchQuery: String = ""
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        HStack{
            List{
                Spacer().frame(height: 30).listRowBackground(Color.clear)
                VStack(alignment: .leading) {
                    if(!plantList.isEmpty) {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(plantList, id: \.self) { plant in
                                NavigationLink(destination: PlantDetailView(plant: plant)) {
                                    PlantCard( image: plant.image ?? "",title: plant.name ?? "", temperature: plant.temperature, humidity: plant.humidity)
                                }
                            }
                        }.padding(.horizontal)
                    }
                }.listRowBackground(Color.clear)
                Spacer().frame(height: 30).listRowBackground(Color.clear)
            }
        }.onAppear{
            plantList = []
            
            user = UserDBManager().getUsers()[0]
            
            // PLANT LIST
            
            let plantListQuery = CKQuery(recordType: "Plant", predicate: predicate)
            
            let plantListOperation = CKQueryOperation(query: plantListQuery)
            
            plantListOperation.recordFetchedBlock = { record in
                    let name = record["name"] ?? ""
                    let description = record["description"]
                    let image = record["image"] as! CKAsset
                    let humidity = record["humidity"] ?? ""
                    let temperature = record["temperature"] ?? ""
                    let recordId = record.recordID
                
                    plantList.append(Plant(
                        id:  Int.random(in: 0..<1000),
                        name: name as! String,
                        description: description as! String,
                        image: image.fileURL?.absoluteString ?? "https://kgo.googleusercontent.com/profile_vrt_raw_bytes_1587515358_10512.png",
                        humidity: humidity as! String,
                        temperature: temperature as! String,
                        recordId: recordId.recordName
                    ))
            }
            
            publicDatabase.add(plantListOperation)
        }.navigationTitle("Tanaman")
    }
}

struct PlantListView_Previews: PreviewProvider {
    static var previews: some View {
        PlantListView()
    }
}
