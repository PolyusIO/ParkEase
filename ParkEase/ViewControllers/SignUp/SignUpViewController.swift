//
//  SignUpViewController.swift
//  ParkEase
//
//  Created by Артемий Дериглазов on 21.05.2023.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet var parkKeyTextField: UITextField!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordFirstTextField: UITextField!
    @IBOutlet var passwordSecondTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonPressed() {
        dismiss(animated: true)
    }
    @IBAction func questionButtonPressed() {
        showAlert(with: "Не знаешь что это за код?", and: "Этот код спрашивай у разработчиков", textField: parkKeyTextField)
    }
}

//MARK: Extension
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
