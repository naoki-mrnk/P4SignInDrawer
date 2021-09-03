//
//  EmailFormatVaridator.swift
//  P4SignInDrawer
//
//  Created by naoki-mrnk on 2021/09/02.
//

import Foundation

struct EmailFormatValidator: Validator {
    // なぜか@がなくても通る...
    let regExpression = "[A-Z0-9a-z._+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    func validate(_ value: String) -> ValidationResult {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regExpression)
        let result = predicate.evaluate(with: value)
        switch result {
        case true: return .valid
        case false: return .invalid(.emailFormat)
        }
    }
    
}
