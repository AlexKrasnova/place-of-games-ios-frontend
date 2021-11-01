//
//  LocationViewController.swift
//  Place of games
//
//  Created by Алёночка on 07.10.2021.
//
import UIKit

class LocationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   @IBOutlet weak var locationTableView: UITableView!
   
    private var location = [LocationModel]()
    private var service = LocationsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.getLocations { (locations) in
            DispatchQueue.main.async {
                self.location = locations
                self.locationTableView.reloadData()
            }
        }
        
        locationTableView.delegate = self
        locationTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return location.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell") as! LocationTableViewCell
        
        let currentLocation = location[indexPath.row]
        cell.nameOfSport.text = currentLocation.name
        cell.addressLocation.text = currentLocation.address
//        cell.photoLocation.image = currentLocation.photo
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showLocationsDetails", sender: location[indexPath.row].id)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? LocationDetailViewController,
              let locationId = sender as? Int
        else { return }
        destinationVC.locationId = locationId
    }
    
    
}
