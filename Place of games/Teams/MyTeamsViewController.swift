//
//  MyTeamsViewController.swift
//  Place of games
//
//  Created by Natalia on 07.10.2021.
//

import UIKit

class MyTeamsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let myTeams: [Team] = [Team(image: UIImage(named: "spartak"), name: "Спартак", isMyCaptain: false),
                           Team(image: UIImage(named: "dinamo"), name: "Динамо", isMyCaptain: true),
                           Team(image: UIImage(named: "zenit"), name: "Зенит", isMyCaptain: false)]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 150
        

    }
    
    // MARK:- UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTeams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTeamsTableViewCell") as! MyTeamsTableViewCell
        let team = myTeams[indexPath.row]
        cell.myTeamsImageView.image = team.image
        cell.teamNameLabel.text = team.name
        cell.teamCaptainLabel.isHidden = !team.isMyCaptain
        
        return cell
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
