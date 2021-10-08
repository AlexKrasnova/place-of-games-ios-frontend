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
   
    
    
    func setData(photo: UIImage, name: String, address: String) {
        photoLocation.image = photo
        nameOfSport.text = name
        addressLocation.text = address
        
    }
}

