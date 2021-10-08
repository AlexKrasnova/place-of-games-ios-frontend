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
            cell.gameImage.image = games[indexPath.row].image
            cell.gameAddress.text = games[indexPath.row].place?.address
            cell.gameCount.text = "\(games[indexPath.row].numberOfParticipants) / \(games[indexPath.row].maxNumberOfParticipants)"
            
            cell.layer.cornerRadius = 20
            cell.layer.masksToBounds = true
            
            return cell
        }
        return UICollectionViewCell()
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    var games: [GameModel]!
    var defaultGames: DefaultGames!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        defaultGames = DefaultGames()
        games = defaultGames.getGames()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            if let destinationVC = segue.destination as? DetailViewController {
                destinationVC.games = sender as? GameModel
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let games = games?[indexPath.row] else { return }
        performSegue(withIdentifier: "toDetailsVC", sender: games)
    }
    
    
    @IBAction func addNewGameButtonTapped(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Пока что новую игру не создать", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
    }
    
}
