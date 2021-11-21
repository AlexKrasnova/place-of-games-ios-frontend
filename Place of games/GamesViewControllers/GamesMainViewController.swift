//
//  MainViewController.swift
//  GamesAround
//
//  Created by Surgeont on 05.10.2021.
//

import UIKit


class GamesMainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            if let destinationVC = segue.destination as? GamesDetailViewController {
                destinationVC.game = sender as? Game
            }
        }
        if let destibationVC = segue.destination as? LocationsViewController {
            destibationVC.title = "Выбор места"
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var games: [Game] = []
    let service = EventService()
    var newGame: Game?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "GameTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        loadData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
  
    }
    
    func loadData() {
        if AuthService.shared.token != nil {
            service.getEvents { games in
                self.games = games
                DispatchQueue.main.async {
                    self.tableView.reloadData()
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
        tableView.reloadData()
    }

}

extension GamesMainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? GameTableViewCell {
            cell.setupCell(game: games[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        performSegue(withIdentifier: "toDetailsVC", sender: games[indexPath.item])
    }
}
