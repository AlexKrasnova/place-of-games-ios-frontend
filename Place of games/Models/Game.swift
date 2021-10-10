//
//  File.swift
//  GamesAround
//
//  Created by Surgeont on 07.10.2021.
//


import UIKit

struct Game: Codable {
    let id: Int
    let name, time: String
    let duration: Int
    let place: Place
    let maxNumberOfParticipants: Int
    let numberOfParticipants: Int
    let category: String = "Категория"
}

// MARK: - Place
struct Place: Codable {
    let id: Int
    let name: String
    let address: String
    let description: String = "Описание"
}
