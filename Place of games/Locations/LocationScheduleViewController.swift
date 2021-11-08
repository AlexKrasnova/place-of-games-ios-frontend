//
//  LocationScheduleViewController.swift
//  Place of games
//
//  Created by Natalia on 06.11.2021.
//

import UIKit

class LocationScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tableView: UITableView!
    
    let service = LocationsService()
    var place: Place!
    var freeTimes: [PlaceFreeTime] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        service.getLocationFreeTime(id: place.id, date: Date()) { freeTimes in
            self.freeTimes = freeTimes
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? CreateEventViewController,
              let place = place,
              let freeTime = sender as? PlaceFreeTime
        else {
            return
        }
        destinationVC.place = place
        destinationVC.selectedFreeTime = freeTime
    }
    
    // MARK: - Actions
    @IBAction func dateChanged() {
        service.getLocationFreeTime(id: place.id, date: datePicker.date) { freeTimes in
            self.freeTimes = freeTimes
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return freeTimes.count * 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.backgroundColor = .lightGray
        if indexPath.row % 2 == 0 {
            let freeTimeCell = tableView.dequeueReusableCell(withIdentifier: "LocationScheduleEmptyCellTableViewCell") as! LocationScheduleEmptyCellTableViewCell
            let freeTime = freeTimes[indexPath.row / 2]
            freeTimeCell.configWith(freeTime: freeTime)
            cell = freeTimeCell
        }
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.row < freeTimes.count * 2 - 1 else { return 4 }
        let startTime = indexPath.row % 2 == 0
            ? freeTimes[indexPath.row / 2].startTime
            : freeTimes[(indexPath.row - 1) / 2].endTime
        let endTime = indexPath.row % 2 == 0
            ? freeTimes[indexPath.row / 2].endTime
            : freeTimes[(indexPath.row + 1) / 2].startTime
        
        let difference = Calendar.current.dateComponents([.minute], from: startTime, to: endTime).minute!
        guard indexPath.row % 2 == 0 else { return CGFloat(difference) }
        return difference < 60 ? 60 : CGFloat(difference)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard indexPath.row % 2 == 0  else { return }
        let index = indexPath.row / 2
        let freeTime = freeTimes[index]
        performSegue(withIdentifier: "showCreateEvent", sender: freeTime)
    }
    

}
