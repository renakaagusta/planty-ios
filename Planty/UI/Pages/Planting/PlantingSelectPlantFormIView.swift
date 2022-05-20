//
//  PlantingSelectPlantFormIView.swift
//  Planty
//
//  Created by renaka agusta on 18/05/22.
//

import SwiftUI
import CloudKit

struct PlantingSelectPlantFormView: View {
    @State var plantList: [Plant] = []
    @State var selectedPlant: Plant = Plant()
    @State var user: User = User()
    @State var moveToPlantingForm = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ZStack{
            List{
                VStack(alignment: .leading) {
                    if(!plantList.isEmpty) {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(plantList, id: \.self) { plant in
                                PlantCard( image: plant.image ?? "",title: plant.name ?? "", temperature: plant.temperature, humidity: plant.humidity,selected: plant.recordId == selectedPlant.recordId ).onTapGesture {
                                    selectedPlant = plant
                                    moveToPlantingForm = true
                                }
                            }
                        }.padding(.horizontal)
                    }
                }
                Spacer().frame(height: 30)
            }
        }.background(
            NavigationLink(
                destination: PlantingFormView(plant: selectedPlant),
                isActive: $moveToPlantingForm
            ) {
                EmptyView()
            }.hidden() // The link is not visible to user
        ).onAppear{
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
        }.navigationTitle("Pilih Tanaman")
    }
}

struct PlantingSelectPlantFormView_Previews: PreviewProvider {
    static var previews: some View {
        PlantingSelectPlantFormView()
    }
}
