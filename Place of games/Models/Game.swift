//
//  File.swift
//  GamesAround
//
//  Created by Surgeont on 07.10.2021.
//


import UIKit

struct Game: Codable {
    let id: Int
    let name: String
    let time: String
    let duration: Int
    let place: Place
    let maxNumberOfParticipants: Int
    var numberOfParticipants: Int
    let category: Category
}
