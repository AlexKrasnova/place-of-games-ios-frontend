//
//  AuthorizationViewController.swift
//  Place of games
//
//  Created by Алёночка on 12.10.2021.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    @IBOutlet weak var loginField: UITextField!
    
    @IBOutlet weak var passField: UITextField!
    
    @IBAction func loginButton(_ sender: UIButton) {
    }
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var firstTimeLabel: UILabel!
    
    @IBAction func signUpButton(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()

    }
    
    func setUpElements () {
        errorLabel.alpha = 0
    }

}
