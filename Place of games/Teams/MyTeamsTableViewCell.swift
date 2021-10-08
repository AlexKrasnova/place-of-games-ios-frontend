//
//  MyTeamsTableViewCell.swift
//  Place of games
//
//  Created by Natalia on 07.10.2021.
//

import UIKit

class MyTeamsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myTeamsImageView: UIImageView!
    
    @IBOutlet weak var teamNameLabel: UILabel!
    
    @IBOutlet weak var teamCaptainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
