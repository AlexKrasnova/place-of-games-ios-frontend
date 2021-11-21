//
//  ProfileTableView.swift
//  Place of games
//
//  Created by Алёночка on 04.11.2021.
//

struct Profile: Codable {

    var genre: String?
    var row: [Game]?
    var expanded: Bool!

    init(genre: String, row: [Game], expanded: Bool) {
        self.genre = genre
        self.row = row
        self.expanded = expanded
    }
}
