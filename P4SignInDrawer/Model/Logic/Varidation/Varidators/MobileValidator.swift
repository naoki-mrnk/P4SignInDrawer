//
//  MobileNumberValidator.swift
//  P4SignInDrawer
//
//  Created by naoki-mrnk on 2021/09/02.
//

import Foundation

struct MobileValidator: CompositeValidator {
    var validators: [Validator] = [
        EmptyValidator(),
        MobileNumberFormatValidator()
    ]
}
