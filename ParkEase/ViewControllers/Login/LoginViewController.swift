//
//  LoginViewController.swift
//  ParkEase
//
//  Created by Сергей Поляков on 14.05.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: Private properties
    private let user = User.getUserData()
    
    //MARK: IB Outlets
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var enterButton: UIButton!
    
    //MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override  func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: IB Actions
    @IBAction func enterButtonTapped() {
        guard loginTextField.text == user.login, passwordTextField.text == user.password else {
            showAlert(
                with: "ОЙ!",
                and: "Неправильный логин или пароль. Попробуйте еще раз.",
                textField: passwordTextField
            )
            return
        }
    }
}

//MARK: Extension
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
