//
//  DetailViewController.swift
//  GamesAround
//
//  Created by Surgeont on 07.10.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var participantsLabel: UILabel!
    
    var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        gameNameLabel.text = game?.name
        gameImage.image = game?.category.image
        timeLabel.text = "Time: \(game!.time)"
        durationLabel.text = "Duration: \(game!.duration) min"
        placeLabel.text = "Where: \(game!.place.name)"
        addressLabel.text = "Address \(game!.place.address)"
        participantsLabel.text = "\(game!.numberOfParticipants) of \(game!.maxNumberOfParticipants)"
        
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func actionButtonPresssed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Временно недоступно", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
}
