import Foundation

import SQLite
 
class UserDBManager {
    
    private var db: Connection?
    
    let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
    let fm = FileManager.default
     
    private var users: Table!
 
    private var id: Expression<Int>!
    private var firstname: Expression<String>!
    private var lastname: Expression<String>!
    private var username: Expression<String>!
    private var userId: Expression<String>!
    private var email: Expression<String>!
    private var phoneNumber: Expression<String>!
    private var photo: Expression<String>!
    private var recordId: Expression<String>!
     
    init () {
        do {
            db = try Connection("\(path)/planty.sqlite3")
             
            users = Table("users")
             
            id = Expression<Int>("id")
            firstname = Expression<String>("firstname")
            lastname = Expression<String>("lastname")
            username = Expression<String>("username")
            userId = Expression<String>("userId")
            email = Expression<String>("email")
            photo = Expression<String>("photo")
            phoneNumber = Expression<String>("phoneNumber")
            recordId = Expression<String>("recordId")
            if (!UserDefaults.standard.bool(forKey: "is_user_table_created")) {
                do {
                    try db?.run(users.create { (t) in
                        t.column(id, primaryKey: true)
                        t.column(userId, unique: true)
                        t.column(firstname)
                        t.column(lastname)
                        t.column(username, unique: true)
                        t.column(email)
                        t.column(photo)
                        t.column(phoneNumber)
                        t.column(recordId)
                    })
                } catch let error {
                    print(error)
                }
                 
                UserDefaults.standard.set(true, forKey: "is_user_table_created")
            }
             
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func addUser(userIdValue: String, firstnameValue: String, lastnameValue: String, usernameValue: String, emailValue: String, photoValue: String, phoneNumberValue: String, recordIdValue: String) {
        do {
            try db?.run(users.insert(userId <- userIdValue, username <- usernameValue, firstname <- firstnameValue, lastname <- lastnameValue, username <- usernameValue, email <- emailValue, photo <- photoValue, phoneNumber <- phoneNumberValue, recordId <- recordIdValue))
        } catch {
            print(error)
        }
    }
    
    public func getUsers() -> [User] {
        var userModels: [User] = []
     
        users = users.order(id.desc)
     
        do {
            if(db != nil) {
                for user in try db!.prepare(users) {
         
                    var userModel: User = User()
         
                    userModel.id = user[id]
                    userModel.userId = user[userId]
                    userModel.firstname = user[firstname]
                    userModel.lastname = user[lastname]
                    userModel.username = user[username]
                    userModel.email = user[email]
                    userModel.photo = user[photo]
                    userModel.phoneNumber = user[phoneNumber]
                    userModel.recordId = user[recordId]
         
                    userModels.append(userModel)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
        
        return userModels
    }
    
    public func getUser(idValue: Int) -> User {
        var userModel: User = User()
        
        do {
            if(db != nil) {
                var user: AnySequence<Row> = try db!.prepare(users.filter(id == idValue))
         
                try user.forEach({ (rowValue) in
                    userModel.id = try rowValue.get(id)
                    userModel.userId = try rowValue.get(userId)
                    userModel.username = try rowValue.get(username)
                    userModel.firstname = try rowValue.get(firstname)
                    userModel.lastname = try rowValue.get(lastname)
                    userModel.email = try rowValue.get(email)
                    userModel.photo = try rowValue.get(photo)
                    userModel.phoneNumber = try rowValue.get(phoneNumber)
                    userModel.recordId = try rowValue.get(recordId)
                })
            }
        } catch {
            print(error)
        }
        
        return userModel
    }
    
    public func updateUser(idValue: Int, userIdValue: String, usernameValue: String,firstnameValue: String, lastnameValue: String, emailValue: String, photoValue: String, phoneNumberValue: String, recordIdValue: String) {
        do {
            let user: Table = users.filter(id == idValue)
            
            try db?.run(user.update(userId <- userIdValue, username <- usernameValue, firstname <- firstnameValue, lastname <- lastnameValue, email <- emailValue, photo <- photoValue, phoneNumber <- phoneNumberValue, recordId <- recordIdValue))
        } catch {
            print(error)
        }
    }
    
    public func deleteUser(idValue: Int) {
        do {
            let user: Table = users.filter(id == idValue)
             
            try db?.run(user.delete())
        } catch {
            print(error)
        }
    }
    
    public func deleteDatabase() {
        do {
            db = nil
            try fm.removeItem(atPath: "\(path)/planty.sqlite3")
            UserDefaults.standard.set(false, forKey: "is_user_table_created")
            UserDefaults.standard.set(false, forKey: "is_transaction_table_created")
            UserDefaults.standard.set(false, forKey: "is_transaction_user_table_created")
        } catch {
            print(error)
        }
    }
}
