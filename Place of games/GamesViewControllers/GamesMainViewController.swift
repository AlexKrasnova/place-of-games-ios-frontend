//
//  MainViewController.swift
//  GamesAround
//
//  Created by Surgeont on 05.10.2021.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? GameCollectionViewCell {
            
            cell.gameName.text = games[indexPath.row].name
            cell.gameImage.image = games[indexPath.row].category.image
            cell.gameAddress.text = games[indexPath.row].place.address
            cell.gameCount.text = "\(games[indexPath.row].numberOfParticipants) / \(games[indexPath.row].maxNumberOfParticipants)"
            
            cell.layer.cornerRadius = 20
            cell.layer.masksToBounds = true
            
            return cell
        }
        return UICollectionViewCell()
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    var games: [Game] = []
    let service = EventService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        service.getEvents { games in
            self.games = games
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            if let destinationVC = segue.destination as? DetailViewController {
                destinationVC.game = sender as? Game
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let game = games[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: game)
    }
    
    @IBAction func addNewGameButtonTapped(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Пока что новую игру не создать", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    
}
