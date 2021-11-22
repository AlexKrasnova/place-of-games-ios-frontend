//
//  CreateEventViewController.swift
//  Place of games
//
//  Created by Natalia on 08.11.2021.
//

import UIKit

class CreateEventViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeAddressLabel: UILabel!
    @IBOutlet weak var eventNameTextField: UITextField!
    @IBOutlet weak var changeTimeButton: UIButton!
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var numberOfParticipantsTextFields: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var modifyEventButton: UIButton!
    
    var editEvent: Event?
    
    var place: Place? {
        didSet {
            changeTimeButton.isEnabled = place != nil
            startTime = nil
            duration = nil
            placeNameLabel.text = place!.name
            placeAddressLabel.text = place!.address
        }
    }
    var startTime: Date? {
        didSet {
            let title = startTime == nil ? "Выбрать..." : startTime?.string(format: "d MMMM HH:mm")
            changeTimeButton.setTitle(title, for: .normal)
        }
    }
    var duration: Int? {
        didSet { durationLabel.text = "\(duration ?? 0) мин." }
    }
    
    var selectedCategory: Category?
    let eventService = EventService()
    let locationService = LocationsService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        categoryTextField.inputView = picker
        let layer = descriptionTextView.layer
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.systemGray6.cgColor
        layer.cornerRadius = 4
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let event = editEvent {
            place = event.place
            startTime = event.time
            duration = event.duration
            eventNameTextField.text = event.name
            numberOfParticipantsTextFields.text = "\(event.maxNumberOfParticipants)"
            categoryTextField.text = selectedCategory?.rawValue
            descriptionTextView.text = event.description
            selectedCategory = event.category
            categoryTextField.text = selectedCategory?.rawValue
            modifyEventButton.setTitle("Изменить", for: .normal)
        }
    }
    
    @IBAction func modifyEvent() {
        let newEvent = Event(id: editEvent?.id ?? 0,
                            name: eventNameTextField.text!,
                            time: startTime!,
                            duration: duration!,
                            place: place!,
                            maxNumberOfParticipants: Int(numberOfParticipantsTextFields.text!) ?? 0,
                            numberOfParticipants: editEvent?.numberOfParticipants ?? 0,
                            description: descriptionTextView.text,
                            category: selectedCategory ?? .unknown,
                            isCurrentUserEnrolled: false,
                            isCurrentUserOwner: true,
                            placeId: place!.id)
        
        let completion = {
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        }
        
        editEvent == nil
            ? eventService.create(event: newEvent, completion: completion)
            : eventService.modifyEvent(event: newEvent, completion: completion)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let locationScheduleVC = segue.destination as? LocationScheduleViewController,
           let place = place {
            locationService.locationBy(id: place.id) { fullPlace in
                locationScheduleVC.place = fullPlace
            }
        }
    }
    
    // MARK: - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
  
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Category.allCases.count
    }
    
    // MARK: - UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Category.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCategory = Category.allCases[row]
        categoryTextField.text = selectedCategory?.rawValue
    }

}
