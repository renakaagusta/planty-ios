//
//  PlantingListView.swift
//  Planty
//
//  Created by renaka agusta on 13/05/22.
//

import SwiftUI
import CloudKit

struct PlantingListView: View {
    
    @State var plantList: [Plant] = []
    @State var plantingList: [Planting] = []
    @State var user: User = User()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                AppTextField()
                Spacer().frame(height: 30)
                    HStack{
                        Text("-")
                    }
                Spacer().frame(height: 30)
                VStack(alignment: .leading) {
                    if(!plantList.isEmpty) {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(plantingList, id: \.self) { planting in VStack {
                                PlantingCard( image: plantList.first(where: {$0.recordId == planting.plant})?.image ?? "",title: plantList.first(where: {$0.recordId == planting.plant})?.name ?? "",
                                             createdAt: planting.createdAt, quantity:String(planting.quantity))
                            }}
                        }.padding(.horizontal)
                    }
                }
                Spacer().frame(height: 30)
            }
        }.onAppear{
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
            
            // PLANTING LIST
            
            let plantingListQuery = CKQuery(recordType: "Planting", predicate: predicate)
                  
            let plantingListOperation = CKQueryOperation(query: plantingListQuery)
                  
            plantingListOperation.recordFetchedBlock = { record in
                if(record["user"] == user.recordId) {
                    let plant = record["plant"] ?? ""
                    let quantity = String(record["quantity"] ?? 0)
                    let createdAt = record["createdAt"]
                    
                    plantingList.append(Planting(
                        id:  Int.random(in: 0..<1000),
                        plant: plant as! String,
                        quantity: Int(quantity) ?? 0,
                        createdAt: createdAt as! Date
                    ))
                }
            }
            
            publicDatabase.add(plantingListOperation)
        }
    }
}

struct PlantingListView_Previews: PreviewProvider {
    static var previews: some View {
        PlantingListView()
    }
}
