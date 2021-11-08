//
//  LocationScheduleEmptyCellTableViewCell.swift
//  Place of games
//
//  Created by Natalia on 06.11.2021.
//

import UIKit

class LocationScheduleEmptyCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var startTimeLabel: UILabel!
    
    @IBOutlet weak var endTimeLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 12
        containerView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configWith(freeTime: PlaceFreeTime) {
        startTimeLabel.text = freeTime.startTime.string(format: "HH:mm")
        endTimeLabel.text = freeTime.endTime.string(format: "HH:mm")
    }

}
