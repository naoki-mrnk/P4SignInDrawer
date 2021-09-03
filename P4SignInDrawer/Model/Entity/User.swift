//
//  User.swift
//  P4SignInDrawer
//
//  Created by naoki-mrnk on 2021/09/02.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var id = NSUUID().uuidString
    @objc dynamic var email = String()
    @objc dynamic var name = String()
    @objc dynamic var mobileNumber = String()
    @objc dynamic var password = String()
    
    convenience init(email: String, name: String, mobileNumber: String, password: String) {
        self.init()
        
        self.email = email
        self.name = name
        self.mobileNumber = mobileNumber
        self.password = password
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
