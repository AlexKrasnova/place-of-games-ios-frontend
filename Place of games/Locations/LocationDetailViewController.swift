//
//  LocationDetailViewController.swift
//  Place of games
//
//  Created by Natalia on 31.10.2021.
//

import UIKit

class LocationDetailViewController: UIViewController {
    
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var scheduleStack: UIStackView!
    
    let service = LocationsService()
    var locationId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationImageView.image = UIImage(named: "football")
        guard let locationId = locationId  else { return }
        service.locationBy(id: locationId) { place in
            DispatchQueue.main.async {
                self.addressLabel.text = place.address
                self.descriptionLabel.text = place.description
                guard let workingHoursList = place.workingHoursList else { return }
                workingHoursList.forEach { workingHours in
                    let label = UILabel()
                    label.text = "\(workingHours.dayOfWeek ?? workingHours.date!) \(workingHours.startTime) - \(workingHours.endTime)"
                    self.scheduleStack.addArrangedSubview(label)
                }
            }
        }
        
    }
    


}
