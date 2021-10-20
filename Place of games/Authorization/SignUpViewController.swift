//
//  SignUpViewController.swift
//  Place of games
//
//  Created by Алёночка on 15.10.2021.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var repeatPassTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegate()
        errorLabel.alpha = 0
        
//      делаю кнопку на старте неактивной
        signUpButton.isEnabled = false
        signUpButton.alpha = 0.5
   
    }
   
    private func setupDelegate() {
        nameTextField.delegate = self
        loginTextField.delegate = self
        passTextField.delegate = self
        repeatPassTextField.delegate = self
    }
    
    // функция для отображения кнопки, при вводе текста
    func textFieldDidEndEditing(_ textField: UITextField) {
        signUpButton.isEnabled = true
        signUpButton.alpha = 1
    }
        
    @IBAction func signUpButton(_ sender: Any) {
        
        AuthService.shared.register(login: loginTextField.text!, password: passTextField.text!, name: nameTextField.text!) { error in
            if let errorModel = error {
                DispatchQueue.main.async {
                    self.errorLabel.text = errorModel.message
                    self.errorLabel.alpha = 1
                }
            } else {
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
        
//        if repeatPassTextField.text == passTextField.text && loginTextField.text != "" && passTextField.text != "" && nameTextField.text != "" && repeatPassTextField.text != "" {
//
//            errorLabel.alpha = 1
//            errorLabel.textColor = .green
//            errorLabel.text = "Регистрация прошла успешно!"
//        } else {
//            print("Ошибка")
//            errorLabel.alpha = 1
//        }
//
//        if repeatPassTextField.text == passTextField.text {
//            signUpButton.isHidden = false
//            signUpButton.isEnabled = true
//            signUpButton.alpha = 1
//        } else {
//            errorLabel.alpha = 1
//            errorLabel.text = "Пароли не совпадают"
//        }
    }
}
