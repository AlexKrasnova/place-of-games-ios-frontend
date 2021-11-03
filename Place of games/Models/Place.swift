//
//  Place.swift
//  Place of games
//
//  Created by Natalia on 31.10.2021.
//

import Foundation

struct Place: Codable {
    let id: Int
    let name: String
    let address: String
    let description: String?
    let workingHoursList: [WorkingHours]?
}
