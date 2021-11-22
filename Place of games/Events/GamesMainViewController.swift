//
//  MainViewController.swift
//  GamesAround
//
//  Created by Surgeont on 05.10.2021.
//

import UIKit

class GamesMainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameCollectionViewCell", for: indexPath) as? GameCollectionViewCell {
            let game = games[indexPath.item]
            
            cell.setupCell(event: game)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 20, height: 150)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            if let destinationVC = segue.destination as? GamesDetailViewController {
                destinationVC.game = sender as? Event
            }
        }
        if let destibationVC = segue.destination as? LocationsViewController {
            destibationVC.title = "Выбор места"
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let game = games[indexPath.item]
        performSegue(withIdentifier: "toDetailsVC", sender: game)
    }
    
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var games: [Event] = []
    let service = EventService()
    var newGame: Event?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "GameCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GameCollectionViewCell")
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    func loadData() {
        if AuthService.shared.token != nil {
            service.getEvents { games in
                self.games = games
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        
        let destinationVC = UIStoryboard(name: "GamesStoryboard", bundle: nil).instantiateViewController(withIdentifier: "AddNewGameViewController")
        present(destinationVC, animated: true, completion: nil)
        
    }
    
    @IBAction func refreshButtonTapped(_ sender: UIBarButtonItem) {
        loadData()
    }

}

