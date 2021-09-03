//
//  RealmManager.swift
//  P4SignInDrawer
//
//  Created by naoki-mrnk on 2021/09/02.
//

import Foundation
import RealmSwift

class RealmManager {
    
    // MARK: - Properties
    static let shared = RealmManager()
    private let realm = try! Realm()
    
    private init() {}
    
    func load<T: Object>(_ object: T.Type) -> Results<T> {
        return realm.objects(object)
    }
    
    func loadUserInformation(email: String) -> User? {
        let user = realm.objects(User.self)
            .filter("email == '\(email)'")
        return user.first
    }
    
    func savedUserInformation(_ user: User) {
        write(user)
    }
}

// MARK: - Private
private extension RealmManager {
    
    func write<T: Object>(_ object: T) {
        do {
            try realm.write { realm.add(object) }
        } catch {
            print(error)
        }
    }
}
