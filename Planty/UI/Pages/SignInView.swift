//
//  SignInView.swift
//  Planty
//
//  Created by renaka agusta on 30/04/22.
//

import UIKit
import SwiftUI
import Firebase
import GoogleSignIn
import AuthenticationServices
import CloudKit

extension View {
    func getRootViewController()->UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
}

struct SignInView: View {

    @State private var moveToDashboard = false
    @ObservedObject var userCollection: UserCollection = UserCollection()
    
    init() {
        UserDBManager().deleteDatabase()
        print("Database deleted")
    }
    
    func handleSignUp(userId: String, firstname: String, lastname: String, email: String) {
            let record = CKRecord(recordType: "UserInfo")
            record.setValue(firstname, forKey: "firstname")
            record.setValue(lastname, forKey: "lastname")
            record.setValue(firstname + lastname, forKey: "username")
            record.setValue(email, forKey: "email")
            record.setValue(userId, forKey: "userId")
                
            publicDatabase.save(record) { (savedRecord, error)      in
                    
                        if error == nil {
                            print("Record Saved")
                            handleSaveUserData(userId: userId, username: firstname+lastname, firstname: firstname, lastname: lastname, email: email, photo: "", phoneNumber: "", recordId: record.recordID.recordName)
                        } else {
                            print("Error saving data")
                            print(error)
                    }
                    
                }
    }
    
    func handleSignIn(userId: String) {      
        let query = CKQuery(recordType: "UserInfo", predicate: predicate)
              
        let operation = CKQueryOperation(query: query)
              
        operation.recordFetchedBlock = { record in
            let userId = record["userId"]
            let email = record["email"]
            let firstname = record["firstname"]
            let lastname = record["lastname"]
            let username = record["username"]
            let photo = record["photo"] as! CKAsset
            let phoneNumber = record["phoneNumber"] ?? ""
            let recordId = record.recordID
            
            handleSaveUserData(userId: userId as! String, username: username as! String, firstname: firstname as! String, lastname: lastname as! String, email: email as! String, photo: photo.fileURL?.absoluteString ?? "https://d17ivq9b7rppb3.cloudfront.net/small/avatar/2020041418493935d6764e1170ae3f0ed8dd7db2da8968.png", phoneNumber: phoneNumber as! String, recordId: recordId.recordName)
            
        }
        
        publicDatabase.add(operation)
    }
    
    func handleSaveUserData(userId: String, username: String, firstname: String, lastname: String, email: String, photo: String, phoneNumber: String, recordId: String) {
        UserDBManager().addUser(userIdValue: userId,firstnameValue: firstname, lastnameValue: lastname,usernameValue: username,emailValue: email,photoValue: photo, phoneNumberValue: phoneNumber, recordIdValue: recordId)
        moveToDashboard = true
    }
    
    var body: some View {
        HStack{
            Spacer().frame(width: 20)
            VStack{
                Spacer().frame(height: 20)
                Image("AppLogo").resizable().frame(width: 200, height: 50).offset(y:10)
                Spacer()
                VStack(alignment: .leading){
                    VStack {
                        HStack{
                            Spacer()
                            SignInWithAppleButton(.continue){request in
                                request .requestedScopes = [.email, .fullName]
                            } onCompletion: { result in
                                switch result {
                                case .success(let auth):
                                    switch auth.credential {
                                    case let credential as ASAuthorizationAppleIDCredential:
                                        let userId = credential.user
                                        let email = credential.email
                                        let firstname = credential.fullName?.givenName
                                        let lastname = credential.fullName?.familyName
                                        
                                        if(email != nil) {
                                            handleSignUp(userId: userId, firstname: firstname!, lastname: lastname!, email: email!)
                                        } else {
                                            handleSignIn(userId: userId)
                                        }
                                    default:
                                        break
                                    }
                                case .failure(let error):
                                    print("Error")
                                    print(error)
                                }
                            }.frame(width: 200, height: 40)
                            Spacer()
                        }
                    }
                }
                Spacer()
                HStack{
                    Text("Selamat datang di").font(Font.subheadline).foregroundColor(Color.gray)
                    Text("Planty").font(Font.subheadline).foregroundColor(Color.primaryColor)
                }
            }
            Spacer().frame(width: 20)
        }.background(
            NavigationLink(
                destination: DashboardView(),
                isActive: $moveToDashboard
            ) {
                EmptyView()
            }.hidden()
        )
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
