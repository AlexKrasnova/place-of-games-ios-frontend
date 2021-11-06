//
//  ProfileViewController.swift
//  Place of games
//
//  Created by Алёночка on 02.11.2021.
//
//
//import UIKit
//
//class ProfileViewController: UIViewController {
//   
//    let myTableView = UITableView()
//    let data = [
//        ProfileTableView(header: "Мои игры", row: ["раз игра", "Два игра"]),
//        ProfileTableView(header: "Записи на мероприятия", row: ["один", "два"])]
//    
//    let indentifire = "myCell"
//    
//    @IBOutlet weak var myProfileLabel: UILabel!
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var loginLabel: UILabel!
//
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let myTableViewFrame = CGRect(x: 20, y: 400, width: 390, height: 600)
//        myTableView.frame = myTableViewFrame
//        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: indentifire)
//        myTableView.delegate = self
//        myTableView.dataSource = self
//        
//        
//    }
//
//}
//
//extension ProfileViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 44
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 44
//    }
//}
//
//extension ProfileViewController: UITableViewDataSource {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        data.count
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        data[section].header
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        data[section].row.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = myTableView.dequeueReusableCell(withIdentifier: indentifire)
//        
//        cell?.textLabel?.text = data[indexPath.section].row[indexPath.row]
//        
//        return cell!
//    }
//    
//    
//    
//    
//}
