//
//  LocationViewController.swift
//  Place of games
//
//  Created by Алёночка on 07.10.2021.
//
import UIKit

class LocationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   @IBOutlet weak var locationTableView: UITableView!
   
    var location = LocationModel.fetchLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        cell.photoLocation.image = currentLocation.photo
        
        return cell
    }
    
}
