//
//  GameTableViewCell.swift
//  Place of games
//
//  Created by Surgeont on 20.10.2021.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var gameCount: UILabel!
    @IBOutlet weak var gameAddress: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(game: Game) {
        gameName.text = game.name
        gameImage.image = game.category.image
        gameAddress.text = game.place.address
        gameCount.text = "Забронировано: \(game.numberOfParticipants) / \(game.maxNumberOfParticipants)"
    }

}
