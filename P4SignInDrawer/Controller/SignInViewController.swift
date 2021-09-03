//
//  LoginViewController.swift
//  LoginViewController
//
//  Created by naoki-mrnk on 2021/09/01.
//

import UIKit

class SignInViewController: UIViewController {
    
    // MARK: - Properties
    private let emailValidator = EmailValidator()
    private let passwordValidator = PasswordValidator()
    
    // MARK: - Outlets
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signInButton: UIButton!
    @IBOutlet private weak var signUpButton: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: - Action
    @IBAction private func tappedSignInButton(_ sender: UIButton) {
        authentication()
    }
    
    @IBAction private func tappedSignUpButton(_ sender: UIButton) {
        
        guard let signUpVC = storyboard?.instantiateViewController(withIdentifier: SignUpViewController.reuseIdentifier) as? SignUpViewController else { return }
        present(signUpVC, animated: true)
    }
}

// MARK: - Private
private extension SignInViewController {
    
    func setup() {
        emailTextField.setUnderLine()
        passwordTextField.setUnderLine()
        signInButton.settingButton()
        signUpButton.settingButton()
    }
    
    // メアドが登録されているか確認する
    func authentication() {
        // メアドの形式を判定
        let emailValidationResult: ValidationResult = emailValidator.validate(emailTextField.text ?? "")
        switch emailValidationResult {
        case .valid:
            print("email OK")
        case .invalid(let error):
            print(error.localizedDescription)
            emailTextField.text = ""
            Alert.presentError(on: self, message: .emailFormat)
            return
        }
        /// メアドがユーザー登録されているか確認
        let email = emailTextField.text!
        let user = RealmManager.shared.load(User.self).filter("email == '\(email)'")
        if user.isEmpty {
            print("new User")
            Alert.presentError(on: self, message: .unregisteredUser)
            return
        } else {
            print("user auth OK")
        }
        /// パスワードの形式を確認
        let passwordValidationResult: ValidationResult = passwordValidator.validate(passwordTextField.text!)
        switch passwordValidationResult {
        case .valid:
            print("password OK")
        case .invalid(let error):
            print(error.localizedDescription)
            passwordTextField.text = ""
            Alert.presentError(on: self, message: .passwordFormat(min: 6))
            return
        }
        let password = passwordTextField.text!
        
        let userInformation = RealmManager.shared.loadUserInformation(email: email)
        if userInformation?.email == email && userInformation?.password == password {
            
        }
        
        guard let splitVC = storyboard?.instantiateViewController(withIdentifier: SplitViewController.reuseIdentifier) as? SplitViewController else { return }
        present(splitVC, animated: true)
    }
    
    
}
