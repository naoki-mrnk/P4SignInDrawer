//
//  MobileNumberFormatValidation.swift
//  P4SignInDrawer
//
//  Created by naoki-mrnk on 2021/09/02.
//

import Foundation

struct MobileNumberFormatValidator: Validator {
    func validate(_ value: String) -> ValidationResult {
        let regExpression = "^[0-9]{11}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regExpression)
        let result = predicate.evaluate(with: value)
        switch result {
        case true: return .valid
        case false: return .invalid(.mobileNumberFormat)
        }
    }
}
