//
//  DayOfWeek.swift
//  Place of games
//
//  Created by Natalia on 12.11.2021.
//

import Foundation

enum DayOfWeek: String, Codable {
    case monday = "MONDAY"
    case tuesday = "TUESDAY"
    case wednesday = "WEDNESDAY"
    case thursday = "THURSDAY"
    case friday = "FRIDAY"
    case saturday =  "SATURDAY"
    case sunday = "SUNDAY"
    
    init(from decoder: Decoder) throws {
        let str = try decoder.singleValueContainer().decode(String.self)
        self = DayOfWeek(rawValue: str) ?? .monday
    }
    
    init(weekDayNumber: Int) {
        switch weekDayNumber {
        case 2:
            self = .monday
        case 3:
            self = .tuesday
        case 4:
            self = .wednesday
        case 5:
            self = .thursday
        case 6:
            self = .friday
        case 7:
            self = .saturday
        case 0:
            self = .sunday
        default:
            self = .sunday
        }
    }
}
