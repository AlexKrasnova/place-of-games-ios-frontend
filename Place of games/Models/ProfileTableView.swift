//
//  ProfileTableView.swift
//  Place of games
//
//  Created by Алёночка on 04.11.2021.
//

struct Profile: Codable {

    var genre: String?
    var row: [String]?
    var expanded: Bool!

    init(genre: String, row: [String], expanded: Bool) {
        self.genre = genre
        self.row = row
        self.expanded = expanded
    }
}
