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
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var numberOfParticipantsTextFields: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var place: Place!
    var startTime: Date!
    var duration: Int!
    
    var selectedCategory: Category?
    let service = EventService()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        placeNameLabel.text = place.name
        placeAddressLabel.text = place.address
        startTimeLabel.text = startTime.string(format: "d MMMM HH:mm")
        durationLabel.text = "\(duration!) мин."
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        categoryTextField.inputView = picker
        let layer = descriptionTextView.layer
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.systemGray6.cgColor
        layer.cornerRadius = 4
    }
    
    @IBAction func createEvent() {
        let newEvent = Game(id: 0,
                            name: eventNameTextField.text!,
                            time: startTime,
                            duration: duration,
                            place: place,
                            maxNumberOfParticipants: Int(numberOfParticipantsTextFields.text!) ?? 0,
                            numberOfParticipants: 0,
                            category: selectedCategory ?? .unknown,
                            placeId: place.id)
        service.create(event: newEvent) {
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
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
