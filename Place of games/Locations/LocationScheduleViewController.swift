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
    @IBOutlet weak var selectedLabel: UILabel!
    @IBOutlet weak var bookTimeButton: UIButton!
    let service = LocationsService()
    var place: Place!
    var slots: [ScheduleTimeSlot] = []
    var selectedStartTime: Date?
    var selectedDuration: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        bookTimeButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        service.getLocationFreeTime(id: place.id, date: Date()) { freeTimes in
            self.updateSlots(freeTimes: freeTimes, date: Date(), interval: 15)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func updateSlots(freeTimes: [PlaceFreeTime], date: Date, interval: Int) {
        var wh = place.workingHoursList?.first(where: { date == $0.date } )
        if wh == nil {
            let dayOfWeekNumber = Calendar.current.dateComponents([.weekday], from: date).weekday!
            let dayOfWeek = DayOfWeek(weekDayNumber: dayOfWeekNumber)
            wh = place.workingHoursList?.first(where: { dayOfWeek == $0.dayOfWeek })
        }
        guard let workingHours = wh else { return }
        var correctedEndTime = workingHours.endTime
        if correctedEndTime < workingHours.startTime {
            correctedEndTime = Calendar.current.date(byAdding: DateComponents(day: 1), to: correctedEndTime)!
        }
        let numberOfSlots = Calendar.current
            .dateComponents([.minute],
                            from: workingHours.startTime,
                            to: correctedEndTime)
            .minute! / interval
        var newSlots = [ScheduleTimeSlot]()
        for i in 0..<numberOfSlots {
            var dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: date)
            let whStartTimeComponents = Calendar.current.dateComponents([.hour, .minute], from: workingHours.startTime)
            dateComponents.hour = whStartTimeComponents.hour
            dateComponents.minute = whStartTimeComponents.minute
            let correctedWHStartTime = Calendar.current.date(from: dateComponents)!
            let startTime = Calendar.current.date(byAdding: DateComponents(minute: i * interval), to: correctedWHStartTime)!
            let endTime = Calendar.current.date(byAdding: DateComponents(minute: interval), to: startTime)!
            let free = freeTimes.contains(where: { $0.endTime >= endTime && $0.startTime <= startTime })
            newSlots.append(ScheduleTimeSlot(startTime: startTime,
                                             durationInMinutes: interval,
                                             busy: !free))
        }
        slots = newSlots
    }
    
    private func updateSelection() {
        let selectedSlots = slots.filter({ $0.selected })
        guard !selectedSlots.isEmpty else {
            bookTimeButton.isEnabled = false
            selectedLabel.text = "Необходимо выбрать интервал"
            return
        }
        
        var hasNoBreaks = true
        if selectedSlots.count > 1 {
            var previousSlot = selectedSlots.first!
            for i in 1..<selectedSlots.count {
                hasNoBreaks = previousSlot.endTime == selectedSlots[i].startTime
                previousSlot = selectedSlots[i]
            }
        }
        
        guard hasNoBreaks else {
            bookTimeButton.isEnabled = false
            selectedLabel.text = "Необходимо выбрать интервал без разрывов"
            return
        }
        
        let duration = selectedSlots.reduce(0, { $0 + $1.durationInMinutes })
        let startTimeString = selectedSlots.first!.startTime.string(format: "HH:mm")
        selectedStartTime = selectedSlots.first!.startTime
        selectedDuration = duration
        bookTimeButton.isEnabled = true
        selectedLabel.text = "Выбрано начало в \(startTimeString), длительность \(duration) мин."
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? CreateEventViewController,
              let place = place,
              let startTime = selectedStartTime,
              let duration = selectedDuration
        else {
            return
        }
        destinationVC.place = place
        destinationVC.startTime = startTime
        destinationVC.duration = duration
    }
    
    
    // MARK: - Actions
    @IBAction func dateChanged() {
        let date = datePicker.date
        service.getLocationFreeTime(id: place.id, date: date) { freeTimes in
            self.updateSlots(freeTimes: freeTimes, date: date, interval: 15)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return slots.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: LocationScheduleSlotTableViewCell.self)) as! LocationScheduleSlotTableViewCell
        cell.backgroundColor = .lightGray
        let slot = slots[indexPath.row]
        cell.configWith(slot: slot)
        cell.selectionStyle = .none
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! LocationScheduleSlotTableViewCell
        slots[indexPath.row].selected.toggle()
        cell.configWith(slot: slots[indexPath.row])
        cell.setSelected(false, animated: false)
        updateSelection()
    }
    

}
