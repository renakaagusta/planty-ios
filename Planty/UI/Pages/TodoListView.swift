//
//  TodoListView.swift
//  Planty
//
//  Created by renaka agusta on 20/05/22.
//

import SwiftUI
import CloudKit

struct TodoListView: View {
    @State var plantList: [Plant] = []
    @State var plantingList: [Planting] = []
    @State var todoList: [Todo] = []
    @State var user: User = User()
    
    var body: some View {
        HStack{
            List{
                VStack(alignment: .leading) {
                    if(!plantList.isEmpty && !plantingList.isEmpty && !todoList.isEmpty) {
                        ForEach(plantingList, id: \.self) { planting in VStack {
                            TodoCard(image: plantList.first(where: {$0.recordId == planting.plant})?.image ?? "", title: plantList.first(where: {$0.recordId == planting.plant})?.name ?? "",
                                     status: todoList.first(where: {$0.planting == planting.recordId})?.planting != nil ? "Selesai" : "Belum selesai",  quantity: String(planting.quantity), planting: planting.recordId, user: user.recordId)
                        }
                        }
                    }
                }
                Spacer().frame(height: 30)
            }
        }.task{
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
            
            do {sleep(1)}
            
            // PLANTING LIST
            
            let plantingListQuery = CKQuery(recordType: "Planting", predicate: predicate)
            
            let plantingListOperation = CKQueryOperation(query: plantingListQuery)
            
            await plantingListOperation.recordFetchedBlock = { record in
                if(record["user"] == user.recordId) {
                    let plant = record["plant"] ?? ""
                    let quantity = String(record["quantity"] ?? 0)
                    let createdAt = record["createdAt"]
                    let recordId = record.recordID.recordName
                    
                    print("planting")
                    print(recordId)
                    
                    plantingList.append(Planting(
                        id:  Int.random(in: 0..<1000),
                        plant: plant as! String,
                        quantity: Int(quantity) ?? 0,
                        createdAt: createdAt as! Date,
                        recordId: recordId
                    ))
                }
            }
            
            publicDatabase.add(plantingListOperation)
            
            do {sleep(1)}
            
            // TODO LIST
            
            let todoListQuery = CKQuery(recordType: "Todo", predicate: predicate)
            
            let todoListOperation = CKQueryOperation(query: todoListQuery)
            
            await todoListOperation.recordFetchedBlock = { record in
                if(record["user"] == user.recordId) {
                    let planting = record["planting"] ?? ""
                    let user = record["user"] ?? ""
                    let createdAt = record["createdAt"]
                    let recordId = record.recordID.recordName
                    
                    print("todo")
                    print(planting)
                    
                    todoList.append(Todo(
                        id:  Int.random(in: 0..<1000),
                        planting: planting as! String,
                        user: user as! String,
                        createdAt: createdAt as! Date,
                        recordId: recordId as! String
                    ))
                }
            }
            
            publicDatabase.add(todoListOperation)
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
