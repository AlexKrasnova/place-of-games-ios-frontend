//
//  ProfileVC3.swift
//  Place of games
//
//  Created by Алёночка on 04.11.2021.
//

import UIKit

var needUpdateMyGames = true
var needUpdateMyEvents = true

class ProfileVC3: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var sections = [Profile]()
    let eventService = EventService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = nil

        if let userInfo = AuthService.shared.userInfo {
            self.loginLabel.text = userInfo.login
            self.nameLabel.text = userInfo.name
        }
        
        sections.append(Profile.init(genre: "⚽️ Мои игры", row: [], expanded: false))
        sections.append(Profile.init(genre: "📅 Запланированные мероприятия", row: [], expanded: false))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if needUpdateMyEvents {
            updateMyEvents()
        }
        if needUpdateMyGames {
            updateMyGames()
        }
        super.viewWillAppear(animated)
    }
    
    func updateMyGames() {
        needUpdateMyGames = false
        eventService.getMyEvents { games in
            let gameNames = games.map { (game) -> String in
                return game.name
            }
            self.sections[0].row = gameNames
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func updateMyEvents() {
        needUpdateMyEvents = false
        eventService.getMyEvents { games in
            let gameNames = games.map { (game) -> String in
                return game.name
            }
            self.sections[1].row = gameNames
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension ProfileVC3: UITableViewDataSource, UITableViewDelegate, ExpandableHeaderViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return sections.count
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return sections[section].row!.count
        }

    internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 44
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if (sections[indexPath.section].expanded) {
                return 44
            } else {
                return 0
            }
        }

    internal func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 2
        }

    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let header = ExpandableHeaderView()
            header.customInit(title: sections[section].genre!, section: section, delegate: self)
            return header
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
            cell.textLabel?.text = sections[indexPath.section].row![indexPath.row]
            return cell
        }

        func toggleSection(header: ExpandableHeaderView, section: Int) {
            sections[section].expanded = !sections[section].expanded
            tableView.beginUpdates()
            for i in 0 ..< sections[section].row!.count {
                tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
            }
            tableView.endUpdates()
        }
    }
