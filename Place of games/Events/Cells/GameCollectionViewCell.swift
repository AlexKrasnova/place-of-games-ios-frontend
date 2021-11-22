//
//  GameCollectionViewCell.swift
//  Place of games
//
//  Created by Surgeont on 20.10.2021.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var joinToGameButton: UIButton!
    @IBOutlet weak var gameImage: UIImageView!
    
    @IBOutlet weak var gameName: UILabel!
    
    @IBOutlet weak var gameCount: UILabel!
    @IBOutlet weak var gameAddress: UILabel!
    
    var event: Event!
    
    private let service = EventService()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        joinToGameButton.addTarget(self, action: #selector(joinToGame), for: .touchUpInside)
        joinToGameButton.setTitle("Записаться", for: .normal)
        joinToGameButton.backgroundColor = UIColor.cyan
    }
    
    func setupCell(event: Event) {
        self.event = event
        
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.systemGray5
        
        gameName.text = event.name
        gameImage.image = event.category.image
        gameAddress.text = event.place.address
        gameCount.text = "Забронировано: \(event.numberOfParticipants) / \(event.maxNumberOfParticipants)"
        
        if event.isCurrentUserEnrolled {
            self.joinToGameButton.setTitle("Отменить", for: .normal)
            self.joinToGameButton.backgroundColor = UIColor.systemGray2
        } else {
            self.joinToGameButton.setTitle("Записаться", for: .normal)
            self.joinToGameButton.backgroundColor = UIColor.cyan
        }
    }
    
    @objc func joinToGame() {
        service.participate(mebership: !event.isCurrentUserEnrolled, game: event) { [weak self] in
            self?.event.isCurrentUserEnrolled.toggle()
            self?.event.numberOfParticipants += self!.event.isCurrentUserEnrolled ? 1 : -1
            DispatchQueue.main.async {
                self?.setupCell(event: self!.event)
            }
        }
    }


}
