//
//  PostSelectImageFormView.swift
//  Planty
//
//  Created by renaka agusta on 18/05/22.
//

import SwiftUI
import CloudKit

struct PostSelectImageFormView: View {
    
    @State var post = Post()
    @State private var image = UIImage()
    @State private var showSheet = false
    @State var showingSuccessAlert: Bool = false
    @State var user = User()
    
    var body: some View {
        HStack {
            Image(uiImage: self.image)
                      .resizable()
                      .cornerRadius(50)
                      .frame(width: 100, height: 100)
                      .background(Color.black.opacity(0.2))
                      .aspectRatio(contentMode: .fill)
                      .clipShape(Circle())

             Text("Change photo")
                 .font(.headline)
                 .frame(maxWidth: .infinity)
                 .frame(height: 50)
                 .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]), startPoint: .top, endPoint: .bottom))
                 .cornerRadius(16)
                 .foregroundColor(.white)
                     .padding(.horizontal, 20)
                     .onTapGesture {
                       showSheet = true
                     }
                }
        
        AppElevatedButton(label: "Simpan", onClick: {
            user = UserDBManager().getUsers()[0]
            
            guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("TempImage.png") else {
                return
            }

            let pngData = image.pngData();
            do {
                try pngData?.write(to: imageURL);
            } catch { }
            
            let record = CKRecord(recordType: "Post")
            record.setValue(post.title, forKey: "title")
            record.setValue(post.description, forKey: "description")
            record.setValue(post.content, forKey: "content")
            record.setValue(user.recordId, forKey: "writer")
            record.setValue(CKAsset(fileURL: imageURL) , forKey: "image")
            record.setValue(NSDate(), forKey: "createdAt")

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
        }).alert("Berhasil menambahkan postingan baru", isPresented: $showingSuccessAlert) {
            Button("Ok") {
                // moveToPlantingListView = true
            }
        }
            .padding(.horizontal, 20)
            .sheet(isPresented: $showSheet) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                }
    }
}

struct PostSelectImageFormView_Previews: PreviewProvider {
    static var previews: some View {
        PostSelectImageFormView()
    }
}
