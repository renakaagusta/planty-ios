//
//  TodoCard.swift
//  Planty
//
//  Created by renaka agusta on 20/05/22.
//

import SwiftUI
import CloudKit

struct TodoCard: View {
    @State var image: String = "https://kgo.googleusercontent.com/profile_vrt_raw_bytes_1587515358_10512.png"
    @State var title: String = "Nombre Producto"
    @State var status: String = "Belum selesai"
    @State var showingSuccessAlert: Bool = false
    @State var quantity: String = "10"
    @State var planting: String = ""
    @State var user: String = ""
    
    var body: some View {
        ZStack(alignment: .leading){
            HStack(){
                if(status != "Selesai") {
                    VStack {
                        Spacer()
                        Text(title).font(Font.body.weight(.bold)).foregroundColor(Color.black)
                        Spacer().frame(height: 2)
                        Text(quantity + " Tanaman").foregroundColor(Color.black)
                        Spacer().frame(height: 2)
                        Text(status).foregroundColor(Color.black)
                        Spacer().frame(height: 10)
                    }
                }
                if(status != "Selesai") {
                    AppElevatedButton(label: "Selesai", onClick: {
                        let record = CKRecord(recordType: "Todo")
                        record.setValue(user, forKey: "user")
                        record.setValue(planting, forKey: "planting")
                        record.setValue(NSDate() as Date, forKey: "createdAt")
                        publicDatabase.save(record) {
                            record, error in
                            if record != nil, error == nil {
                                showingSuccessAlert = true
                            } else {
                                print("ERROR")
                                print(error)
                            }
                        }
                        showingSuccessAlert = true
                    }).alert("Berhasil menyelesaikan task", isPresented:  $showingSuccessAlert) {
                        Button("Ok") {
                        }
                    }.frame(width: 140)
                }
            }.frame(width: 350, height: 200).background(status == "Selesai" ? Color.secondaryColor : Color.lightGray).cornerRadius(20).padding(10)
            HStack {
                    VStack(alignment:.leading){
                        AsyncImage(url: URL(string: image != "" ? image : "https://kgo.googleusercontent.com/profile_vrt_raw_bytes_1587515358_10512.png")!,
                                   placeholder: { Text("Loading ...") },
                                   image: { Image(uiImage: $0).resizable() }).frame( width: 110,height: 145)
                            if(status == "Selesai") {
                                VStack {
                                    Spacer()
                                    Text(title).font(Font.body.weight(.bold)).foregroundColor(Color.black)
                                    Spacer().frame(height: 2)
                                    Text(quantity + " Tanaman").foregroundColor(Color.black)
                                    Spacer().frame(height: 2)
                                    Text(status).foregroundColor(Color.black)
                                        Spacer().frame(height: 10)
                                }
                            }
            }
            }.offset(x: 30, y:-50)
        }
    }
}

struct TodoCard_Previews: PreviewProvider {
    static var previews: some View {
        TodoCard()
    }
}

