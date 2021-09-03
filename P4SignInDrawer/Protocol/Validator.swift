//
//  Varidator.swift
//  P4SignInDrawer
//
//  Created by naoki-mrnk on 2021/09/02.
//

import Foundation

enum ValidationResult {
    case valid
    case invalid(ValidationError)
}

/// Validation結果のエラーに使用
/// LocalizedErrorを使用することで .localizedDescriptionでエラーメッセージを表示可能
protocol ValidationErrorProtocol: LocalizedError { }

/// 文字列のValidation
protocol Validator {
    func validate(_ value: String) -> ValidationResult
}
