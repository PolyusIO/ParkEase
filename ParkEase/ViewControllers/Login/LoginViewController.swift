//
//  LoginViewController.swift
//  ParkEase
//
//  Created by Сергей Поляков on 14.05.2023.
//

import UIKit

protocol SignUpViewControllerDelegate {
    func setNewValues(of users: [User])
}

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: IB Outlets
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var enterButton: UIButton!
    
    //MARK: Private properties
    private var users = User.getUsers()
    
    //MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let signUpVC = segue.destination as? SignUpViewController else { return }
        signUpVC.delegate = self
        signUpVC.users = users
    }
    
    //MARK: TextFieldDidBeginEditing
    func textFieldDidBeginEditing(_ textField: UITextField) {
        turnToWhite(textField)
    }
    
    //MARK: IB Actions
    @IBAction func enterButtonTapped() {
        
        var isUserValid = false
        
        for user in users {
            if loginTextField.text == user.login && passwordTextField.text == user.password {
                isUserValid = true
            }
        }
        
        if loginTextField.text == "" {
            reportInvalidInputOf(loginTextField)
        }
        
        if passwordTextField.text == "" {
            reportInvalidInputOf(passwordTextField)
        }
            
         if !isUserValid {
            showAlert(
                with: "ОЙ!",
                and: "Неправильный логин или пароль. Попробуйте еще раз.",
                textField: passwordTextField)
        }
    }
}

//MARK: Show Alert Method
extension LoginViewController {
    private func showAlert(
        with title: String,
        and message: String,
        textField: UITextField
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAlert = UIAlertAction(title: "OK", style: .default) { _ in
            textField.text = ""
        }
        let registrationAlert = UIAlertAction(title: "Регистрация", style: .default) { _ in
            let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
            let signUpVC = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
            
            self.present(signUpVC, animated: true)
        }
        
        present(alert, animated: true)
        alert.addAction(okAlert)
        alert.addAction(registrationAlert)
    }
}

//MARK: SignUpViewControllerDelegate
extension LoginViewController: SignUpViewControllerDelegate {
    func setNewValues(of users: [User]) {
        self.users = users
    }
}

//MARK: Private Methods
extension LoginViewController {
    private func shake(the textField: UITextField) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.duration = 0.25
        animation.values = [-7, 7, -5, 5, 0 ]
        textField.layer.add(animation, forKey: "shake")
    }
    
    private func turnToWhite(_ textField: UITextField) {
        if textField.isEditing {
            textField.backgroundColor = .white
            textField.layer.borderWidth = 0
        }
    }
    
    private func reportInvalidInputOf(_ textField: UITextField) {
        textField.layer.borderWidth = 1.5
        textField.layer.cornerRadius = textField.frame.width / 50
        textField.layer.borderColor = UIColor(red: 1, green: 0.3, blue: 0.3, alpha: 1).cgColor
        
        textField.backgroundColor = UIColor(red: 1, green: 0.9, blue: 0.9, alpha: 0.9)
    
        shake(the: textField)
    }
}
