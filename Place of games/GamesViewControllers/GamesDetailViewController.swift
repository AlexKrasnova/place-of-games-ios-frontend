//
//  DetailViewController.swift
//  GamesAround
//
//  Created by Surgeont on 07.10.2021.
//

import UIKit

class GamesDetailViewController: UIViewController {
    
   
    @IBOutlet weak var joinToGameButton: UIButton!
    @IBOutlet weak var gameAddressLabel: UILabel!
    @IBOutlet weak var gameParticipantsLabel: UILabel!
    @IBOutlet weak var gameTimeLabel: UILabel!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var gameImage: UIImageView!
    
    var gameStatus = 1
    var newNumberOfParticipants: Int?
    
    var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI(game: game!)
        joinToGameButton.addTarget(self, action: #selector(joinToGame), for: .touchUpInside)
        
    }
    
    func setupUI(game: Game) {
        
        gameName.text = game.name
        gameImage.image = game.category.image
        gameImage.layer.cornerRadius = 20
        gameTimeLabel.text = "\(game.time) (Длительность: \(game.duration) мин"
        gameAddressLabel.text = game.place.address
        gameParticipantsLabel.text = "Занято \(game.numberOfParticipants) из \(game.maxNumberOfParticipants)"
        joinToGameButton.setTitle("Записаться на игру", for: .normal)
        joinToGameButton.backgroundColor = UIColor.blue
        
        
        if game.numberOfParticipants == game.maxNumberOfParticipants {
            joinToGameButton.backgroundColor = UIColor.systemGray5
            joinToGameButton.setTitle("Мест нет", for: .normal)
        }
    }
    
    @objc func joinToGame() {
        
        switch gameStatus {
        case 1:
            gameStatus = 2
            newNumberOfParticipants = game!.numberOfParticipants + 1
            gameParticipantsLabel.text = "Занято \(newNumberOfParticipants!) из \(game!.maxNumberOfParticipants)"
            joinToGameButton.setTitle("Вы записаны!  (отменить)", for: .normal)
            joinToGameButton.backgroundColor = UIColor.systemGray2
        case 2:
            gameStatus = 1
            setupUI(game: game!)
            
        default: break
        }
    }
}
