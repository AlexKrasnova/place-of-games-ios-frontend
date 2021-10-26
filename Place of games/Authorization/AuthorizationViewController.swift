//
//  AuthorizationViewController.swift
//  Place of games
//
//  Created by Алёночка on 12.10.2021.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    var login: String?
    var pass: String?
    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        
    }
    
    func setUpElements () {
        errorLabel.alpha = 0
    }
    
    @IBAction func login(_ sender: UIButton) {
        AuthService.shared.login(login: loginField.text!, password: passField.text!) { error in
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
    }
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var firstTimeLabel: UILabel!
    @IBAction func signUpButton(_ sender: Any) {
    }
    
}
