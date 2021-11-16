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
    var place: Place?
    
    let showLoacationScheduleIdentifier = "showLoacationSchedule"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationImageView.image = UIImage(named: "football")
        guard let locationId = locationId  else { return }
        service.locationBy(id: locationId) { place in
            self.place = place
            DispatchQueue.main.async {
                self.addressLabel.text = place.address
                self.descriptionLabel.text = place.description
                guard let workingHoursList = place.workingHoursList else { return }
                workingHoursList.forEach { workingHours in
                    let label = UILabel()
                    label.text = "\(workingHours.dayOfWeek?.rawValue ?? workingHours.date!.string(format: "d MMMM yyyy")) \(workingHours.startTime.string(format: "HH:mm")) - \(workingHours.endTime.string(format: "HH:mm"))"
                    self.scheduleStack.addArrangedSubview(label)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == showLoacationScheduleIdentifier,
              let destinationsVC = segue.destination as? LocationScheduleViewController,
              let place = place
        else {
            return
        }
        destinationsVC.place = place
    }

}
