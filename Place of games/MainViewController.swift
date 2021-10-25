//
//  MainViewController.swift
//  Place of games
//
//  Created by Natalia on 16.10.2021.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if AuthService.shared.token == nil {
            let authStoriboard = UIStoryboard(name: "Authorization", bundle: nil)
            let viewController = authStoriboard.instantiateInitialViewController()!
            viewController.modalPresentationStyle = .fullScreen
            present(viewController, animated: false, completion: nil)
        } else {
            if let gamesNavVC = viewControllers?.first as? UINavigationController,
               let gamesVC = gamesNavVC.viewControllers.first as? GamesMainViewController {
                gamesVC.loadData()
            }
        }
    }
}