//
//  File.swift
//  GamesAround
//
//  Created by Surgeont on 07.10.2021.
//


import UIKit

struct GameModel {
    let id: Int
    let name, time: String
    let duration: Int
    let place: Place?
    let maxNumberOfParticipants: Int
    let numberOfParticipants: Int
    let image: UIImage
}

// MARK: - Place
struct Place {
    let id: Int
    let name: String
    let address: String
}
