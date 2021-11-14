//
//  LocationViewController.swift
//  Place of games
//
//  Created by Алёночка on 07.10.2021.
//
import UIKit

class LocationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
   @IBOutlet weak var locationTableView: UITableView!
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchString = ""
   
    private var allPlaces = [Place]()
    private var places: [Place] {
        guard !searchString.isEmpty else { return allPlaces }
        return allPlaces.filter { $0.name.contains(searchString) }
    }
    private var service = LocationsService()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        service.getLocations { locations in
            DispatchQueue.main.async {
                self.allPlaces = locations
                self.locationTableView.reloadData()
            }
        }
        
        locationTableView.delegate = self
        locationTableView.dataSource = self
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
//        definesPresentationContext = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell") as! LocationTableViewCell
        
        let currentLocation = places[indexPath.row]
        cell.nameOfSport.text = currentLocation.name
        cell.addressLocation.text = currentLocation.address
//        cell.photoLocation.image = currentLocation.photo
        
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
    
    // MARK: - UISearchBarDelegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchString = searchText
        locationTableView.reloadData()
    }
    
}
