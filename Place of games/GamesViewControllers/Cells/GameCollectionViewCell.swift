//
//  GameCollectionViewCell.swift
//  Place of games
//
//  Created by Surgeont on 20.10.2021.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    var gameStatus = 1
    @IBOutlet weak var joinToGameButton: UIButton!
    @IBOutlet weak var gameImage: UIImageView!
    
    @IBOutlet weak var gameName: UILabel!
    
    @IBOutlet weak var gameCount: UILabel!
    @IBOutlet weak var gameAddress: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        joinToGameButton.addTarget(self, action: #selector(joinToGame), for: .touchUpInside)
        joinToGameButton.setTitle("Записаться", for: .normal)
        joinToGameButton.backgroundColor = UIColor.cyan
    }
    
    func setupCell() {
        
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.systemGray5
        
        
        
    }
    
    @objc func joinToGame() {
        switch gameStatus {
        case 1:
            gameStatus = 2
            joinToGameButton.setTitle("Отменить", for: .normal)
            joinToGameButton.backgroundColor = UIColor.systemGray2
        case 2:
            gameStatus = 1
            joinToGameButton.setTitle("Записаться", for: .normal)
            joinToGameButton.backgroundColor = UIColor.cyan
        default: break
        }
    }

}
