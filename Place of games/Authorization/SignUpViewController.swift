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
   
    }
   
    private func setupDelegate() {
        nameTextField.delegate = self
        loginTextField.delegate = self
        passTextField.delegate = self
        repeatPassTextField.delegate = self
    }
    
    
    @IBAction func nameChanged(_ sender: UITextField) {
    }
    @IBAction func loginChanged(_ sender: UITextField) {
    }
    @IBAction func passChanged(_ sender: UITextField) {
    }
    @IBAction func repassChanged(_ sender: UITextField) {
    }
    
    
    // функция для отображения кнопки, при вводе текста
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if nameTextField.text != "" && loginTextField.text != "" && passTextField.text != "" &&  repeatPassTextField.text != "" && repeatPassTextField.text == passTextField.text {
//
//        signUpButton.isEnabled = true
//        signUpButton.backgroundColor = .systemTeal
//        } else {
//            signUpButton.isEnabled = false
//        }
//    }
//
//
//        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//            if nameTextField.text != "" && loginTextField.text != "" && passTextField.text != "" && repeatPassTextField.text != "" && repeatPassTextField.text == passTextField.text {
//
////                let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
//
//                signUpButton.isEnabled = true
//                signUpButton.backgroundColor = .systemTeal
//                    } else {
//                    signUpButton.isEnabled = false
//                    }
//            return true
//        }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard !string.isEmpty else { return true }

        var nameText = self.nameTextField.text ?? ""
        var loginText = self.loginTextField.text ?? ""
        var passText = self.passTextField.text ?? ""
        var repassText = self.repeatPassTextField.text ?? ""

        switch textField{
        case self.nameTextField:
            nameText += string
        case self.loginTextField:
            loginText += string
        case self.passTextField:
            passText += string
        case self.repeatPassTextField:
            repassText += string
        default:
            break
        }

        if nameText != "" && loginText != "" && passText != "" && repassText != "" && passText == repassText {
            self.signUpButton.isEnabled = true
            signUpButton.backgroundColor = .systemTeal
        } else {
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = .systemGray6
        }

        return true
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
                    self.navigationController?.popViewController(animated: true)
                    
                    
                }
            }
        }
    }
}
