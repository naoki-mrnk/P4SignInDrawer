//
//  Alert.swift
//  P4SignInDrawer
//
//  Created by naoki-mrnk on 2021/09/02.
//

import UIKit

public enum Alert {
    
    private static func createBasicAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
        return alert
    }
    
    static func presentError(on viewController: UIViewController, message: ValidationError) {
        let alert = createBasicAlert(title: "エラー", message: message.errorDescription!, handler: nil)
        DispatchQueue.main.async { viewController.present(alert, animated: true) }
    }
    
    static func presentSignUp(on viewController: UIViewController) {
        let alert = createBasicAlert(title: "サインアップ成功", message: "", handler: nil)
        DispatchQueue.main.async { viewController.present(alert, animated: true) }
    }
    
}
