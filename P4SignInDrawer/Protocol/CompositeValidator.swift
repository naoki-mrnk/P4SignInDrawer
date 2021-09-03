//
//  CompositeValidator.swift
//  P4SignInDrawer
//
//  Created by naoki-mrnk on 2021/09/02.
//

import Foundation

/// 文字列のValidationに関する責務。複数のValidatorを保持する
/// validatorsに格納されている順にValidationをかけていき、
/// 該当したエラーを返却する。
protocol CompositeValidator: Validator {
    var validators: [Validator] { get }
    func validate(_ value: String) -> ValidationResult
}

extension CompositeValidator {
    
    func validate(_ value: String) -> [ValidationResult] {
        return validators.map { $0.validate(value) }
    }
    
    func validate(_ value: String) -> ValidationResult {
        let results: [ValidationResult] = validate(value)
        
        let errors = results.filter { result -> Bool in
            switch result {
            case .valid: return true
            case .invalid: return false
            }
        }
        return errors.first ?? .valid
    }
}
