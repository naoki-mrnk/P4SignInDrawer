//
//  EmailVaridator.swift
//  P4SignInDrawer
//
//  Created by naoki-mrnk on 2021/09/02.
//

import Foundation

struct EmailValidator: CompositeValidator {
    var validators: [Validator] = [
        EmptyValidator(),
        EmailFormatValidator()
    ]
}
