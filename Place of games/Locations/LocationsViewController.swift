//
//  LocationViewController.swift
//  Place of games
//
//  Created by Алёночка on 07.10.2021.
//
import UIKit

class LocationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   @IBOutlet weak var locationTableView: UITableView!
   
    private var places = [Place]()
    private var service = LocationsService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.getLocations { (locations) in
            DispatchQueue.main.async {
                self.places = locations
                self.locationTableView.reloadData()
            }
        }
        
        locationTableView.delegate = self
        locationTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell") as! LocationTableViewCell
        
        let currentLocation = places[indexPath.row]
        cell.setupCell()
        cell.nameOfSport.text = currentLocation.name
        cell.addressLocation.text = currentLocation.address
        cell.photoLocation.image = nil
        if let imageName = LocationImage(rawValue: currentLocation.id) {
            cell.photoLocation.image = UIImage(named: "\(imageName)")
        }
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showLocationsDetails", sender: places[indexPath.row].id)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? LocationDetailViewController,
              let locationId = sender as? Int
        else { return }
        destinationVC.locationId = locationId
    }
    
    
}
