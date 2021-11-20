//
//  DetailViewController.swift
//  GamesAround
//
//  Created by Surgeont on 07.10.2021.
//

import UIKit

class GamesDetailViewController: UIViewController {
    
    struct Response: Codable {
        let participants: [Person]
    }
    
    struct Person: Codable {
        let id: Int
        let name: String
    }
    
   
    @IBOutlet weak var participantsTableView: UITableView!
    @IBOutlet var windowView: UIView!
    @IBOutlet weak var joinToGameButton: UIButton!
    @IBOutlet weak var gameAddressLabel: UILabel!
    @IBOutlet weak var gameParticipantsLabel: UILabel!
    @IBOutlet weak var gameTimeLabel: UILabel!
    @IBOutlet weak var gameName: UILabel!
    @IBOutlet weak var visualEffectFrame: UIVisualEffectView!
    var effect: UIVisualEffect!
    @IBOutlet weak var gameImage: UIImageView!

    var newNumberOfParticipants: Int?
    
    var game: Event?
    var persons: [Person] = []
    
    private let service = EventService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        visualEffectFrame.frame = view.bounds
//        visualEffectFrame.center = view.center
//        effect = visualEffectFrame.effect
        visualEffectFrame.effect = nil
        
        
        setupUI(game: game!)
        joinToGameButton.addTarget(self, action: #selector(joinToGame), for: .touchUpInside)
        
    }
    
    
    func setupUI(game: Event) {
        self.game = game
        gameName.text = game.name
        gameImage.image = game.category.image
        gameImage.layer.cornerRadius = 20
        gameTimeLabel.text = "\(game.time) (Длительность: \(game.duration) мин"
        gameAddressLabel.text = game.place.address
        gameParticipantsLabel.text = "Занято \(game.numberOfParticipants) из \(game.maxNumberOfParticipants)"
        
        if game.numberOfParticipants == game.maxNumberOfParticipants {
            joinToGameButton.backgroundColor = UIColor.systemGray5
            joinToGameButton.setTitle("Мест нет", for: .normal)
        }
        
        if game.isCurrentUserEnrolled {
            joinToGameButton.setTitle("Отменить", for: .normal)
            joinToGameButton.backgroundColor = UIColor.systemGray2
        } else {
            joinToGameButton.setTitle("Записаться", for: .normal)
            joinToGameButton.backgroundColor = UIColor.cyan
        }
        
    }
    
    @objc func joinToGame() {
        service.participate(mebership: !game!.isCurrentUserEnrolled, game: game!) { [weak self] in
            self?.game!.isCurrentUserEnrolled.toggle()
            self?.game!.numberOfParticipants += self!.game!.isCurrentUserEnrolled ? 1 : -1
            DispatchQueue.main.async {
                self?.setupUI(game: self!.game!)
            }
        }
    }

    @IBAction func showWindowWithParticipants(_ sender: UIBarButtonItem) {
        
        self.view.addSubview(windowView)
        setupWindow()
        windowView.center = view.center
        windowView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        windowView.alpha = 0
        
        UIView.animate(withDuration: 0.3) {
            self.visualEffectFrame.effect = self.effect
            self.windowView.alpha = 1
            self.windowView.transform = CGAffineTransform.identity
        }
    }
    
    private func setupWindow() {
        windowView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width*2/3, height: UIScreen.main.bounds.width)
        windowView.layer.cornerRadius = 20
        windowView.backgroundColor = UIColor.systemGray3
        
        participantsTableView.delegate = self
        participantsTableView.dataSource = self
        participantsTableView.register(UINib(nibName: "ParticipantsTableViewCell", bundle: nil), forCellReuseIdentifier: "ParticipantsTableViewCell")
        getParticipants { persons in
            self.persons = persons
            DispatchQueue.main.async {
                self.participantsTableView.reloadData()
            }
        }
        
    }
    
    func getParticipants(completion: @escaping ([Person]) -> Void) {
        let id = (game?.id)!
        let session = URLSession(configuration: .default)
        let request = API.getParticipants(eventId: id).asUrlRequest()
        session.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            let games = try! JSONDecoder().decode(Response.self, from: data)
            let persons: [Person] = games.participants
            completion(persons)
        }.resume()
    }
    
    @IBAction func dismissWindow(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.windowView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.windowView.alpha = 0
            self.visualEffectFrame.effect = nil
        } completion: { (_) in
            self.windowView.removeFromSuperview()
            self.windowView.transform = CGAffineTransform.identity
        }
    }
}


extension GamesDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ParticipantsTableViewCell", for: indexPath) as? ParticipantsTableViewCell {
            let person = persons[indexPath.row]
            cell.nameLabel.text = person.name
//            cell.nameLabel.text = "some"
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }


}
