//
//  AddNewGameViewController.swift
//  Place of games
//
//  Created by Surgeont on 24.10.2021.
//

import UIKit


class AddNewGameViewController: UIViewController {
    
    
 
    @IBOutlet weak var addNameTextField: UITextField!
    @IBOutlet weak var addTimeTextField: UITextField!
    @IBOutlet weak var addDurationTextField: UITextField!
    @IBOutlet weak var addMaxNumberTextField: UITextField!
    @IBOutlet weak var addAddressTextField: UITextField!
    
    
    let service = EventService()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    
    
   
    

//    @IBAction func createButtonTapped(_ sender: UIButton) {
//
//        let name = addNameTextField.text!
//        let time = addTimeTextField.text!
//        let duration = addDurationTextField.text!
//        let durationInt = Int(duration)!
//        let maxNumber = addMaxNumberTextField.text
//        let maxNumberInt = Int(maxNumber!)!
//        let address = addAddressTextField.text!
//        let id = 3
//        let numberOfParticipants = 0
//
//        let newGame = Game(id: id,
//                           name: name,
//                           time: Date(),
//                           duration: durationInt,
//                           place: Place(id: id,
//                                        name: "no",
//                                        address: address,
//                                        description: "no",
//                                        workingHoursList: nil),
//                           maxNumberOfParticipants: maxNumberInt,
//                           numberOfParticipants: numberOfParticipants,
//                           category: .basketball
//        )
//        let service = EventService()
//        service.create(event: newGame) {
//            needUpdateMyGames = true
//        }
//
//        dismiss(animated: true, completion: nil)
//
//
//
//
//
//    }
//
}
