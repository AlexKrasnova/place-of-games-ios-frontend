//
//  LocationScheduleSlotTableViewCell.swift
//  Place of games
//
//  Created by Natalia on 06.11.2021.
//

import UIKit

class LocationScheduleSlotTableViewCell: UITableViewCell {
    
    @IBOutlet weak var startTimeLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 12
        containerView.clipsToBounds = true
    }
    
    func configWith(slot: ScheduleTimeSlot) {
        startTimeLabel.text = slot.startTime.string(format: "HH:mm")
        if slot.busy {
            containerView.backgroundColor = .lightGray
        } else {
            containerView.backgroundColor = slot.selected ? .purple : .white
        }
    }

}
