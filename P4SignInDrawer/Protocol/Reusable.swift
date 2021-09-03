//
//  Reusable.swift
//  P4SignInDrawer
//
//  Created by cmStudent on 2021/09/01.
//

import Foundation

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension NSObject: Reusable {}
