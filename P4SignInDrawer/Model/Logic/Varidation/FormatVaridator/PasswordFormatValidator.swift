//
//  PasswordFormatVaridator.swift
//  P4SignInDrawer
//
//  Created by naoki-mrnk on 2021/09/02.
//

import Foundation

struct PasswordFormatValidator: Validator {
    let min: Int
    func validate(_ value: String) -> ValidationResult {
        let regExpression = "^(?=.*?[A-Za-z])(?=.*?[0-9])[A-Za-z0-9]{\(min),}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regExpression)
        let result = predicate.evaluate(with: value)
        print("Pasvilid: \(result)")
        switch result {
        case true: return .valid
        case false: return .invalid(.passwordFormat(min: min))
        }
    }
}
