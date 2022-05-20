//
//  PostListView.swift
//  Planty
//
//  Created by renaka agusta on 13/05/22.
//

import SwiftUI
import CloudKit

struct PostListView: View {
    @State var moveToPostForm: Bool = false
    @State var userList: [User] = []
    @State var postList: [Post] = []
    @State var searchQuery: String = ""
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        HStack{
            List{
                VStack(alignment: .leading) {
                    if(!userList.isEmpty && !postList.isEmpty) {
                        ForEach(postList, id: \.self) { post in
                            NavigationLink(destination: PostDetailView(post: post)) {}
                                PostCard(writer: userList.first(where: {$0.recordId == post.writer}) ?? User(), post: post)
                        }
                    }
                }.listRowBackground(Color.clear)
                Spacer().frame(height: 30).listRowBackground(Color.clear)
        }.background(
            NavigationLink(
                destination: PostFormView(),
                isActive: $moveToPostForm
            ) {
                EmptyView()
            }.hidden()).onAppear{
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
            
            do { sleep(2) }
                        
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
        }}.navigationTitle("Postingan").toolbar{
            ToolbarItem() {
                    Button("Tambah") {
                        moveToPostForm = true
                    }
            }
        }.background(
            NavigationLink(
                destination:  PostFormView(),
                isActive: $moveToPostForm
            ) {
                EmptyView()
            }.hidden() // The link is not visible to user
        )
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
