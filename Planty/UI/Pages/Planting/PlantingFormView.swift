//
//  PlantingFormView.swift
//  Planty
//
//  Created by renaka agusta on 18/05/22.
//

import SwiftUI
import CloudKit

struct PlantingFormView: View {
    @State var plant: Plant = Plant()
    @State var user: User = User()
    @State var quantity: String = "0"
    @State var showingSuccessAlert: Bool = false
    @State var moveToPlantingListView: Bool = false
    
    var body: some View {
        HStack{
            Spacer().frame(width: 15)
            List{
                Text("Tanaman yang anda piliih").font(Font.body.weight(.bold)).foregroundColor(Color.black)
                Spacer().frame(height: 4)
                Text(plant.name)
                Spacer().frame(height: 15)
                Text("Jumlah tanaman").font(Font.body.weight(.bold)).foregroundColor(Color.black)
                Spacer().frame(height: 4)
                AppTextField(placeholder: "Jumlah tanaman", field: $quantity)
                Spacer().frame(height: 20)
                AppElevatedButton(label: "Tambahkan", onClick: {
                    let record = CKRecord(recordType: "Planting")
                    record.setValue(plant.recordId, forKey: "plant")
                    record.setValue(Int(quantity), forKey: "quantity")
                    record.setValue(user.recordId, forKey: "user")
                    record.setValue(NSDate() , forKey: "createdAt")
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
                }).alert("Berhasil menambahkan tanaman baru", isPresented: $showingSuccessAlert) {
                    Button("Ok") {
                        moveToPlantingListView = true
                    }
                }
            }
            Spacer().frame(width: 15)
        }.navigationTitle("Tanaman baru").onAppear{
            user = UserDBManager().getUsers()[0]
        }.background(
            NavigationLink(
                destination: PlantingListView(),
                isActive: $moveToPlantingListView
            ) {
                EmptyView()
            }.hidden())
    }
}

struct PlantingFormView_Previews: PreviewProvider {
    static var previews: some View {
        PlantingFormView()
    }
}
