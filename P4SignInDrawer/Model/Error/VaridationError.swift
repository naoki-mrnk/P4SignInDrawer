//
//  VaridationError.swift
//  P4SignInDrawer
//
//  Created by naoki-mrnk on 2021/09/02.
//

import Foundation

enum ValidationError: ValidationErrorProtocol {

    case empty
    case emailFormat
    case existingUser
    case passwordFormat(min: Int)
    case mobileNumberFormat
    case wrongPassword
    case unregisteredUser
    case faildLogin
    
    var errorDescription: String? {
        switch self {
        case .empty: return "文字を入力してください"
        case .emailFormat: return "パスワードの形式が正しくありません"
        case .existingUser: return "このメールアドレスはすでに登録されています"
        case .passwordFormat(let min): return "英語の大文字,小文字,数字を含めた\(min)文字以上で入力してください"
        case .mobileNumberFormat: return "携帯番号を正しい形式で入力してください"
        case .wrongPassword: return "パスワードが違います"
        case .unregisteredUser: return "このメールアドレスは登録されていません"
        case .faildLogin: return "メールアドレスかパスワードが違います"
        }
    }
}
