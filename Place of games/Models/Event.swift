//
//  File.swift
//  GamesAround
//
//  Created by Surgeont on 07.10.2021.
//


import UIKit

struct Event: Codable {
    let id: Int
    let name: String
    let time: Date
    let duration: Int
    let place: Place
    let maxNumberOfParticipants: Int
    var numberOfParticipants: Int
    let description: String?
    let category: Category
    var isCurrentUserEnrolled: Bool
    let isCurrentUserOwner: Bool?
    
    var placeId: Int?
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case time
        case duration
        case place
        case placeId
        case maxNumberOfParticipants
        case numberOfParticipants
        case description
        case category
        case isCurrentUserEnrolled
        case isCurrentUserOwner
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(time.string(format: "yyyy-MM-dd'T'HH:mm:ss"), forKey: .time)
        try container.encode(duration, forKey: .duration)
        try container.encode(place.id, forKey: .placeId)
        try container.encode(maxNumberOfParticipants, forKey: .maxNumberOfParticipants)
        try container.encode(category.rawValue, forKey: .category)
        try container.encode(description ?? "", forKey: .description)
    }
}
