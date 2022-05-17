//
//  Auth.swift
//  Planty
//
//  Created by renaka agusta on 07/05/22.
//

import Foundation
import SQLite
 
class UserDBManager {
    
    private var db: Connection?
    
    let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
    let fm = FileManager.default
     
    private var users: Table!
 
    private var id: Expression<Int>!
    private var name: Expression<String>!
    private var category: Expression<String>!
    private var price: Expression<Int>!
    private var quantity: Expression<Int>!
     
    init () {
        do {
            db = try Connection("\(path)/cashier.sqlite3")
             
            users = Table("users")
             
            id = Expression<Int>("id")
            name = Expression<String>("name")
            category = Expression<String>("category")
            price = Expression<Int>("price")
            quantity = Expression<Int>("quantity")

            if (!UserDefaults.standard.bool(forKey: "is_user_table_created")) {
                do {
                    try db?.run(users.create { (t) in
                        t.column(id, primaryKey: true)
                        t.column(name, unique: true)
                        t.column(category)
                        t.column(price)
                        t.column(quantity)
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
    
    public func addUser(nameValue: String, categoryValue: String, priceValue: Int, quantityValue: Int) {
        do {
            try db?.run(users.insert(name <- nameValue, category <- categoryValue, price <- priceValue, quantity <- quantityValue))
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
                    userModel.name = user[name]
                    userModel.category = user[category]
                    userModel.price = user[price]
                    userModel.quantity = user[quantity]
         
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
                    userModel.name = try rowValue.get(name)
                    userModel.category = try rowValue.get(category)
                    userModel.price = try rowValue.get(price)
                    userModel.quantity = try rowValue.get(quantity)
                })
            }
        } catch {
            print(error)
        }
        
        return userModel
    }
    
    public func updateUser(idValue: Int, nameValue: String, categoryValue: String, priceValue: Int, quantityValue: Int) {
        do {
            let user: Table = users.filter(id == idValue)
            
            try db?.run(user.update(name <- nameValue, category <- categoryValue, price <- priceValue, quantity <- quantityValue))
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
            try fm.removeUser(atPath: "\(path)/cashier.sqlite3")
            UserDefaults.standard.set(false, forKey: "is_user_table_created")
            UserDefaults.standard.set(false, forKey: "is_transaction_table_created")
            UserDefaults.standard.set(false, forKey: "is_transaction_user_table_created")
        } catch {
            print(error)
        }
    }
}
