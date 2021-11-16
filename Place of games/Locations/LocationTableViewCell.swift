//
//  LocationTableViewCell.swift
//  Place of games
//
//  Created by Алёночка on 07.10.2021.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoLocation: UIImageView!
    @IBOutlet weak var nameOfSport: UILabel!
    @IBOutlet weak var addressLocation: UILabel!
    
 
    func setupCell() {
        
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.systemGray5
        
    }
}

