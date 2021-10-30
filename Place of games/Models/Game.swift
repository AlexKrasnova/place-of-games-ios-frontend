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

// MARK: - Place
struct Place: Codable {
    let id: Int
    let name: String
    let address: String
    let description: String
}


//struct Game: Codable {
//    let id: Int
//    let name: String
//    let time: String
//    let duration: Int
//    let place: Place
//    let maxNumberOfParticipants: Int
//    let numberOfParticipants: Int
//    let welcomeDescription: Description
//    let category: String
//}
//
//// MARK: - Place
//struct Place: Codable {
//    let id: Int
//    let name: String
//    let address: String
//    let placeDescription: String
//    let workingHoursList: [WorkingHoursList]
//}
//
//// MARK: - WorkingHoursList
//struct WorkingHoursList: Codable {
//    let dayOfWeek: DayOfWeek?
//    let date: String?
//    let startTime: String
//    let endTime: String
//}
//
//enum DayOfWeek: Codable {
//    case friday
//    case monday
//    case saturday
//    case sunday
//    case thursday
//    case tuesday
//    case wednesday
//}
//
//enum Description: Codable {
//    case крутаяТусовка
//    case любительскаяИгра
//    case профессиональныйУровень
//}
//
