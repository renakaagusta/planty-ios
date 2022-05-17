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
    @State var plantingList: [Planting] = []
    @State var user: User = User()
    
    var body: some View {
        HStack{
            Spacer().frame(width: 15)
            VStack(alignment: .leading){
                AppTextField()
                Spacer().frame(height: 30)
                ScrollView(.horizontal) {
                    HStack{
                        NavigationLink(destination: PlantFormView()){
                            AppElevatedButton(label: "+")
                        }
                        AppElevatedButton(label: "Semua", backgroundColor: Color.black)
                        AppFlatButton(label: "")
                    }
                }
                Spacer().frame(height: 30)
                VStack(alignment: .leading) {
                    VStack{
                        HStack{
                            PlantingCard()
                            Spacer()
                            PlantingCard()
                        }
                        Spacer().frame(height: 30)
                        HStack{
                            PlantingCard()
                            Spacer()
                            PlantingCard()
                        }
                    }}
                Spacer().frame(height: 30)
            }
            Spacer().frame(width: 15)
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

struct PlantListView_Previews: PreviewProvider {
    static var previews: some View {
        PlantListView()
    }
}
