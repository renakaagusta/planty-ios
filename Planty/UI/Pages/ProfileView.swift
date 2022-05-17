//
//  ProfileView.swift
//  Planty
//
//  Created by renaka agusta on 30/04/22.
//

import SwiftUI
import CloudKit

struct ProfileView: View {
    
    @State var plantingList: [Planting] = []
    @State var postList: [Post] = []
    @State var user: User = User()
    
    var body: some View {
        ScrollView{
        VStack{
            HStack {
                Spacer().frame(width: 20)
                VStack{
                    HStack(){
                        Image("Profile").resizable().frame(width: 90, height: 90).cornerRadius(80)
                        Spacer().frame(width: 20)
                        VStack(alignment:.leading){
                            Text(user.username).font(Font.title2.bold())
                            Spacer().frame(height: 10)
                            Text(user.firstname + user.lastname).font(Font.subheadline).foregroundColor(Color.gray)
                        }
                        Spacer()
                    }
                    Spacer().frame(height: 30)
                    HStack{
                        Spacer().frame(width: 10)
                        Image(systemName: "phone").foregroundColor(Color.gray)
                        Spacer().frame(width: 20)
                        Text("-").font(Font.caption).foregroundColor(Color.gray)
                        Spacer()
                    }
                    Spacer().frame(height: 20)
                    HStack{
                        Spacer().frame(width: 10)
                        Image(systemName: "mail").foregroundColor(Color.gray)
                        Spacer().frame(width: 20)
                        Text(user.email).font(Font.caption).foregroundColor(Color.gray)
                        Spacer()
                    }
                }
                Spacer().frame(width: 20)
            }
            Spacer().frame(height: 40)
            VStack {
                HStack{
                    HStack{
                        Spacer()
                        VStack {
                            Text("20").font(Font.title2.bold())
                            Spacer().frame(height: 10)
                            Text("Tanaman").font(Font.subheadline.bold()).foregroundColor(Color.gray)
                        }
                        Spacer()
                    }
                    Spacer().frame(width: 1, height: 100).background(Color.lightGray)
                    HStack{
                        Spacer()
                        VStack {
                            Text("3").font(Font.title2.bold())
                            Spacer().frame(height: 10)
                            Text("Artikel").font(Font.subheadline.bold()).foregroundColor(Color.gray)
                        }
                        Spacer()
                    }
                }.frame(width: .infinity, height: 100).border(Color.lightGray, width: 1)
                Spacer().frame(height: 30)
                HStack{
                    Spacer().frame(width: 30)
                    Image(systemName: "heart").resizable().frame(width: 25, height: 25).foregroundColor(Color.primaryColor)
                    Spacer().frame(width: 20)
                    Text("Favoritmu").font(Font.title3.bold())
                    Spacer()
                }
                Spacer().frame(height: 30)
                HStack{
                    Spacer().frame(width: 30)
                    Image(systemName: "info.circle").resizable().frame(width: 25, height: 25).foregroundColor(Color.primaryColor)
                    Spacer().frame(width: 20)
                    Text("Tentang").font(Font.title3.bold())
                    Spacer()
                }
                Spacer().frame(height: 30)
                HStack{
                    Spacer().frame(width: 30)
                    Image(systemName: "gear").resizable().frame(width: 25, height: 25).foregroundColor(Color.primaryColor)
                    Spacer().frame(width: 20)
                    Text("Pengaturan").font(Font.title3.bold())
                    Spacer()
                }
            }
            Spacer()
            HStack{
                Spacer().frame(width: 30)
                Image(systemName: "power").resizable().frame(width: 25, height: 25).foregroundColor(Color.red)
                Spacer().frame(width: 20)
                Text("Keluar").font(Font.title3.bold()).foregroundColor(Color.red)
                Spacer()
            }
        }.onAppear{
                user = UserDBManager().getUsers()[0]
                
                // PLANTING LIST
                
                let plantingListQuery = CKQuery(recordType: "Planting", predicate: predicate)
                      
                let plantingListOperation = CKQueryOperation(query: plantingListQuery)
                      
                plantingListOperation.recordFetchedBlock = { record in
                    if(record["user"] == user.recordId) {
                        let plant = record["plant"] ?? ""
                        let quantity = record["quantity"] ?? ""
                        let createdAt = record["createdAt"]
                        plantingList.append(Planting(
                            id:  Int.random(in: 0..<1000),
                            plant: plant as! String,
                            quantity: quantity as! Int,
                            createdAt: createdAt as! Date
                        ))
                    }
                }
                
                publicDatabase.add(plantingListOperation)
                            
                // POST LIST
                let postListQuery = CKQuery(recordType: "Post", predicate: predicate)
                      
                let postListOperation = CKQueryOperation(query: plantingListQuery)
                      
                postListOperation.recordFetchedBlock = { record in
                    if(record["writer"] == user.recordId) {
                        let title = record["title"]
                        let description = record["description"]
                        let writer = record["write"]
                        let createdAt = record["createdAt"]
                        postList.append(Post(
                            id:  Int.random(in: 0..<1000),
                            writer: writer as! String, title: title as! String,
                            description: description as! String,
                            createdAt: createdAt as! Date
                        ))
                    }
                }
                
                publicDatabase.add(postListOperation)
                
                print("planting")
                print(plantingList)
                print("post")
                print(postList)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
