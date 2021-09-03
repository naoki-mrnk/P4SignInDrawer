//
//  EmptyVaridator.swift
//  P4SignInDrawer
//
//  Created by naoki-mrnk on 2021/09/02.
//

import Foundation

struct EmptyValidator: Validator {
    
    func validate(_ value: String) -> ValidationResult {
        if value.isEmpty == true {
            return .invalid(.empty)
        } else {
            return .valid
        }
    }
}
