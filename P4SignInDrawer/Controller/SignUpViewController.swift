//
//  SignUpViewController.swift
//  P4SignInDrawer
//
//  Created by naoki-mrnk on 2021/09/01.
//

import UIKit
import RealmSwift

class SignUpViewController: UIViewController {
    
    // MARK: - Properties
    private let emptyValidator = EmptyValidator()
    private let emailValidator = EmailValidator()
    private let mobileValidator = MobileValidator()
    private let passwordValidator = PasswordValidator()
    
    // MARK: - Outlet
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var mobileNumberTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var confirmPasswordTextField: UITextField!
    @IBOutlet private weak var signUpButton: UIButton!
    @IBOutlet private weak var signInButton: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: - Action
    @IBAction private func tappedSignUpButton(_ sender: UIButton) {
        signUp()
    }
    
    @IBAction private func tappedSignInButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

// MARK: - Private
private extension SignUpViewController {
    func setup() {
        emailTextField.setUnderLine()
        nameTextField.setUnderLine()
        mobileNumberTextField.setUnderLine()
        passwordTextField.setUnderLine()
        confirmPasswordTextField.setUnderLine()
        signUpButton.settingButton()
        signInButton.settingButton()
    }
    
    
    func signUp() {
        // メアドの形式を確認
        let emailValidationResult: ValidationResult = emailValidator.validate(emailTextField.text ?? "")
        switch emailValidationResult {
        case .valid:
            print("email OK")
        case .invalid(let error):
            print(error.localizedDescription)
            Alert.presentError(on: self, message: .emailFormat)
            return
        }
        /// メアドがユーザー登録されているか確認
        let email = emailTextField.text!
        let user = RealmManager.shared.load(User.self).filter("email == '\(email)'")
        if user.isEmpty {
            print("new User")
        } else {
            Alert.presentError(on: self, message: .existingUser)
            return
        }
        // 名前が空か確認
        let nameValidationResult: ValidationResult = emptyValidator.validate(nameTextField.text ?? "")
        switch nameValidationResult {
        case .valid:
            print("name OK")
        case .invalid(let error):
            print(error.localizedDescription)
            Alert.presentError(on: self, message: .empty)
            return
        }
        // 携帯番号の形式を確認
        let mobileValidationResult: ValidationResult = mobileValidator.validate(mobileNumberTextField.text ?? "")
        switch mobileValidationResult {
        case .valid:
            print("mobile number OK")
        case .invalid(let error):
            print(error.localizedDescription)
            Alert.presentError(on: self, message: .mobileNumberFormat)
            return
        }
        /// パスワードの形式を確認
        let passwordValidationResult: ValidationResult = passwordValidator.validate(passwordTextField.text ?? "")
        switch passwordValidationResult {
        case .valid:
            print("password OK")
            break
        case .invalid(let error):
            print(error.localizedDescription)
            Alert.presentError(on: self, message: .passwordFormat(min: 6))
            return
        }
        // 確認用パスワードが空か確認
        let confirmPasswordValidationResult: ValidationResult = emptyValidator.validate(confirmPasswordTextField.text ?? "")
        switch confirmPasswordValidationResult {
        case .valid:
            print("confirm password OK")
        case .invalid(let error):
            print(error.localizedDescription)
            Alert.presentError(on: self, message: .empty)
            return
        }
        /// パスワードと確認用のパスワードが一致しているか確認
        if passwordTextField.text! == confirmPasswordTextField.text! {
            print("password match")
        } else {
            Alert.presentError(on: self, message: .wrongPassword)
            return
        }
        
        let name = nameTextField.text!
        let mobile = mobileNumberTextField.text!
        let password = passwordTextField.text!
        
        addUserData(email: email, name: name, mobileNumber: mobile, password: password)
    }
    
    /// ユーザーデータを保存
    func addUserData(email: String, name: String, mobileNumber:String, password: String) {
        let user = User(email: email, name: name, mobileNumber: mobileNumber, password: password)
        RealmManager.shared.savedUserInformation(user)
        Alert.presentSignUp(on: self)
    }
}
