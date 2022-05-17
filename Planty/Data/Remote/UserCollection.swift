//
//  UserCollection.swift
//  Planty
//
//  Created by renaka agusta on 08/05/22.
//

import Foundation
import FirebaseFirestore

class UserCollection: ObservableObject {
    
    @Published var users = [User]()
    private var db = Firestore.firestore()
    
    func getAllUsers() {
        /*db.collection("users").addSnapshotListener { (querySnapshot, error) in
             guard let documents = querySnapshot?.documents else {
               print("No documents")
               return
             }

             self.users = documents.map { queryDocumentSnapshot -> User in
               let data = queryDocumentSnapshot.data()
               let name = data["name"] as? String ?? ""
                 let username = data["username"] as? String ?? ""
               let email = data["email"] as? String ?? ""
                 let password = data["password"] as? String ?? ""
                 let photo = data["photo"] as? String ?? ""
                 let user = User(id: queryDocumentSnapshot.documentID, name: name, email: email, username: username, password: password, photo: photo)

                 return user
             }
           }*/
    }
    
    func addUser(nameValue: String, usernameValue: String, emailValue: String, passwordValue: String, photoValue: String) {
        db.collection("users").addDocument(data: ["name": nameValue,"username": usernameValue, "email": emailValue, "password": passwordValue, "photo": photoValue])
    }
}
