//
//  ProfileVC3.swift
//  Place of games
//
//  Created by Алёночка on 04.11.2021.
//

import UIKit

class Profile {
    
    var genre: String?
    var row: [String]?
    var expanded: Bool!
    
    init(genre: String, row: [String], expanded: Bool) {
        self.genre = genre
        self.row = row
        self.expanded = expanded
    }
}

class ProfileVC3: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var sections = [Profile]()
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = nil
        
        sections.append(Profile.init(genre: "🙋🏼‍♂️ Мои данные", row: ["Имя","Логин"], expanded: false))
        sections.append(Profile.init(genre: "⚽️ Мои игры", row: ["Игра 1", "Игра 2", "Игра 3"], expanded: false))
        sections.append(Profile.init(genre: "📅 Запланированные мероприятия", row: ["Мероприятие1", "Мероприятие2", "Мероприятие3"], expanded: false))

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

    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return sections.count
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return sections[section].row?.count ?? 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.backgroundColor = UIColor.clear
//        cell.textLabel?.text = sections[indexPath.section].row?[indexPath.row]
//        return cell
//    }
//
////    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
////        return sections[section].genre
////    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 60))
//        view.layer.cornerRadius = 10
//        view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
//
//        let header = ExpandableHeaderView()
//    header.customInit(title: sections[Profile].genre, section: section, delegate: self)
//            return header
//
//        let lbl = UILabel(frame: CGRect(x: 15, y: 0, width: view.frame.width - 15, height: 40))
//        lbl.font = UIFont.systemFont(ofSize: 20)
//        lbl.text = sections[section].genre
//        view.addSubview(lbl)
//        return view
//    }
////
////    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
////        return 40
////    }
//
////    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        return 50
////    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//                if (sections[indexPath.section].expanded) {
//                    return 44
//                } else {
//                    return 0
//                }
//            }
//
//    internal func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//                return 2
//            }
//
//    private func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//            let header = ExpandableHeaderView()
//        header.customInit(title: sections[Profile].genre, section: section, delegate: self)
//                return header
//            }
//
//    func toggleSection(header: ExpandableHeaderView, section: Int) {
//                sections[section].expanded = !sections[section].expanded
//
//
//                tableView.beginUpdates()
//        for i in 0 ..< sections[section].row!.count {
//                    tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
//                }
//                tableView.endUpdates()
//            }
//
//    }
}
