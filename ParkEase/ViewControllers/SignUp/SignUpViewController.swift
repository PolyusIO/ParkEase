//
//  SignUpViewController.swift
//  ParkEase
//
//  Created by Артемий Дериглазов on 21.05.2023.
//

import UIKit

class SignUpViewController: UIViewController {
    
    //MARK: IB Outlets
    @IBOutlet var parkKeyTextField: UITextField!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordFirstTextField: UITextField!
    @IBOutlet var passwordSecondTextField: UITextField!
    
    //MARK: Public properties
    var users = User.getUsers()
    var delegate: SignUpViewControllerDelegate!
    
    //MARK: OverrideMethods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: IB Actions
    @IBAction func saveButtonPressed() {
        if loginTextField.text != "" && passwordFirstTextField.text != "" && parkKeyTextField.text != "" && passwordFirstTextField.text == passwordSecondTextField.text {
            let newUser = User(login: loginTextField.text ?? "", password: passwordFirstTextField.text ?? "", parkKey: parkKeyTextField.text ?? "", car: [])
            users.append(newUser)
            delegate.setNewValues(of: users)
            dismiss(animated: true)
        } else {
            showAlert(with: "Упс!", and: "Будьте внимательнее", textField: passwordFirstTextField)
        }
    }
    
    @IBAction func questionButtonPressed() {
        showAlert(
            with: "Не знаешь что это за код?",
            and: "Этот код спрашивай у разработчиков",
            textField: parkKeyTextField
        )
    }
}

//MARK: Show Alert
extension SignUpViewController {
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
        
        present(alert, animated: true)
        alert.addAction(okAlert)
    }
}



