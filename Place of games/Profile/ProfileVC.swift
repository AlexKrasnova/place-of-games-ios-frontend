//
//  ProfileVC.swift
//  Place of games
//
//  Created by Алёночка on 04.11.2021.
//
//
//import UIKit
//
//class ProfileVC: UIViewController {
//    
//    @IBOutlet weak var imageViewBackground: UIImageView!
//    @IBOutlet weak var tableView: UITableView!
//    var expertise = [Dictionary<String, Any>]()
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
////        tableView.tableFooterView = UIView(frame: .zero)
////        tableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
//        tableView.register(ProfileCell.classForCoder(), forCellReuseIdentifier: "ProfileCell")
//        
//        tableView.estimatedRowHeight = 60.0
//        tableView.delegate = self
//        tableView.dataSource = self
//        
//    }
//    func createDataSource() {
//        expertise.append(["title": "Мой профиль", "value": ["Имя", "Логин"]])
//        expertise.append(["title": "Мои игры", "value": ["раз игра", "два игра", "три игра"]])
//        expertise.append(["title": "Мои записи на мероприятия", "value": ["футбол завтра", "сегодня бескетбол", "во вторник хоккей"]])
//    }
//}
//
//extension ProfileVC: UITableViewDataSource {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return expertise.count
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let profileTitles = expertise[section]["value"] as? [String] else {
//        return 2
//        }
//        return profileTitles.count
//    }
//    
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileCell
//        guard let profileTitles = expertise[indexPath.section]["value"] as? [String] else {
//        return cell
//        }
//        cell.setProfileTitles(profileTitles[indexPath.row])
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//            let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: tableView.frame.size.width, height: 50.0))
//            view.backgroundColor = .systemGreen
//            let titleLabel = UILabel(frame: CGRect(x: 15.0, y: 0.0, width: view.frame.size.width, height: 50.0))
//            titleLabel.textColor = .white
//            titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
//            if let title = expertise[section]["title"] as? String {
//                titleLabel.text = title
//            }
//            view.addSubview(titleLabel)
//            return view
//        }
//        
//        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return 50.0
//        }
//    }
//
//
//extension ProfileVC: UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//}
