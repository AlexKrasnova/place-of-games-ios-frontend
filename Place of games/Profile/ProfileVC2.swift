//
//  ProfileVC2.swift
//  Place of games
//
//  Created by Алёночка on 04.11.2021.
//
////
//import UIKit
//
//class ProfileVC2: UIViewController, UITabBarDelegate, UITableViewDataSource, ExpandableHeaderViewDelegate {
//
//
//
//    @IBOutlet weak var tableView: UITableView!
//
//    var sections = [
//        ProfileTableView(genre: "🙋🏼‍♂️ Мои данные",
//                         row: ["Логин", "Имя"],
//                         expanded: false),
//        ProfileTableView(genre: "⚽️ Мои игры",
//                         row: ["Игра1", "Игра2"],
//                         expanded: false),
//        ProfileTableView(genre: "📅 Запланированные мероприятия",
//                         row: ["Мероприятие1", "Мероприятие2", "Мероприятие3"],
//                         expanded: false),
//
//
//    ]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//            return sections.count
//        }
//
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return sections[section].row.count
//        }
//
//    private func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//            return 44
//        }
//
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            if (sections[indexPath.section].expanded) {
//                return 44
//            } else {
//                return 0
//            }
//        }
//
//    private func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//            return 2
//        }
//
//    private func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//            let header = ExpandableHeaderView()
//            header.customInit(title: sections[section].genre, section: section, delegate: self)
//            return header
//        }
//
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell")!
//            cell.textLabel?.text = sections[indexPath.section].row[indexPath.row]
//            return cell
//        }
//
//        func toggleSection(header: ExpandableHeaderView, section: Int) {
//            sections[section].expanded = !sections[section].expanded
//
//
//            tableView.beginUpdates()
//            for i in 0 ..< sections[section].row.count {
//                tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
//            }
//            tableView.endUpdates()
//        }
//
//
//  
//}
