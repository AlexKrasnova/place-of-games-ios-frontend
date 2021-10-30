//
//  GameCollectionViewCell.swift
//  Place of games
//
//  Created by Surgeont on 20.10.2021.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gameImage: UIImageView!
    
    @IBOutlet weak var gameName: UILabel!
    
    @IBOutlet weak var gameCount: UILabel!
    @IBOutlet weak var gameAddress: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell() {
        
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.systemGray5
        
        
        
    }

}
