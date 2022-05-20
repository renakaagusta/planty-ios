//
//  HomeView.swift
//  Planty
//
//  Created by renaka agusta on 28/04/22.
//

import SwiftUI
import CloudKit
import Alamofire
import SwiftyJSON

struct HomeView: View {
    
    @State var plantList: [Plant] = []
    @State var userList: [User] = []
    @State var plantingList: [Planting] = []
    @State var postList: [Post] = []
    @State var user: User = User()
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
    }
    
    let columns = [
        GridItem(spacing: 10),
        GridItem(spacing: 10),
    ]
    
    var body: some View {
        List{
            HStack{
                Spacer()
                Image("AppLogo").resizable().frame(width: 200, height: 50).offset(y:10)
                Spacer()
            }.listRowBackground(Color.clear)
            Spacer().frame(height: 10).listRowBackground(Color.clear)
            VStack(alignment: .leading) {
                HStack {
                    Text("Tanaman Anda").font(Font.title2.bold())
                    Spacer()
                    NavigationLink(destination: PlantingListView()){
                        Text("Lihat semua").foregroundColor(Color.primaryColor)
                    }
                }.listRowBackground(Color.clear)
                Spacer().frame(height: 30).listRowBackground(Color.clear)
                if(!plantList.isEmpty) {
                    LazyVGrid(columns: columns, spacing: 0) {
                        ForEach(plantingList, id: \.self) { planting in HStack {
                            PlantingCard( image: plantList.first(where: {$0.recordId == planting.plant})?.image ?? "",title: plantList.first(where: {$0.recordId == planting.plant})?.name ?? "",
                                          createdAt: planting.createdAt, quantity:String(planting.quantity))
                        }}
                    }.padding(.horizontal)
                }
            }.listRowBackground(Color.clear)
            Spacer().frame(height: 4).listRowBackground(Color.clear)
            HStack {
                Text("Artikel terbaru").font(Font.title2.bold())
                Spacer()
                NavigationLink(destination: PostListView()){
                    Text("Lihat semua").foregroundColor(Color.primaryColor)
                }
            }.listRowBackground(Color.clear)
            Spacer().frame(height: 4).listRowBackground(Color.clear)
            if(!userList.isEmpty && !postList.isEmpty) {
                ForEach(postList, id: \.self) { post in
                    NavigationLink(destination: PostDetailView(post: post, writer: userList.first(where: {$0.recordId == post.writer}) ?? User())) {
                            PostCard(writer: userList.first(where: {$0.recordId == post.writer}) ?? User(), post: post)
                    }
                }.listRowBackground(Color.clear)
            }
        }.navigationBarBackButtonHidden(true).onAppear{
            plantList = []
            plantingList = []
            postList = []
            
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
            
            // USER LIST
            
            let userListQuery = CKQuery(recordType: "UserInfo", predicate: predicate)
            
            let userListOperation = CKQueryOperation(query: userListQuery)
            
            userListOperation.recordFetchedBlock = { record in
                let id = record["plant"] ?? ""
                let username = record["username"] ?? ""
                let photo = record["photo"] as! CKAsset
                let recordId = record.recordID.recordName
                userList.append(User(
                    id:  Int.random(in: 0..<1000),
                    username:  username as! String,
                    photo: photo.fileURL?.absoluteString ?? "https://kgo.googleusercontent.com/profile_vrt_raw_bytes_1587515358_10512.png",
                    recordId:  recordId as! String
                ))
            }
            
            publicDatabase.add(userListOperation)
            
            do {sleep(1)}
            
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
            
            do {sleep(1)}
            
            // POST LIST
            let postListQuery = CKQuery(recordType: "Post", predicate: predicate)
            
            let postListOperation = CKQueryOperation(query: postListQuery)
            
            postListOperation.recordFetchedBlock = { record in
                
                let title = record["title"]
                let description = record["description"]
                let content = record["content"]
                let writer = record["writer"]
                let createdAt = record["createdAt"]
                let image = record["image"] as! CKAsset
                
                postList.append(Post(
                    id:  0,
                    writer: writer as! String, title: title as! String,
                    description: description as! String,
                    content: content as! String,
                    image:  image.fileURL?.absoluteString ?? "https://kgo.googleusercontent.com/profile_vrt_raw_bytes_1587515358_10512.png",
                    createdAt: record.creationDate as! Date
                ))
            }
            
            publicDatabase.add(postListOperation)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
