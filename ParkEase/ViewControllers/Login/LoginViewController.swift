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

class LoginViewController: UIViewController {

    
    //MARK: IB Outlets
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var enterButton: UIButton!
    
    //MARK: Private properties
    private var users = User.getUsers()

    //MARK: Override Methods
    override  func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let signUpVC = segue.destination as? SignUpViewController else { return }
        signUpVC.delegate = self
    }
    
    //MARK: IB Actions
    @IBAction func enterButtonTapped() {
        for user in users {
            guard user.login == loginTextField.text  && user.password == passwordTextField.text 
            else {
                showAlert(
                    with: "ОЙ!",
                    and: "Неправильный логин или пароль. Попробуйте еще раз.",
                    textField: passwordTextField
                )
                return
            }
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
