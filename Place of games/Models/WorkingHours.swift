//
//  WorkingHours.swift
//  Place of games
//
//  Created by Natalia on 31.10.2021.
//

import Foundation

struct WorkingHours: Codable {
    
    let dayOfWeek: DayOfWeek?
    let date: Date?
    let startTime: Date
    let endTime: Date
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dayOfWeek = try values.decode(DayOfWeek?.self, forKey: .dayOfWeek)
        let dateString = try values.decode(String?.self, forKey: .date)
        if let dateString = dateString {
            date = dateString.date(format: "yyyy-MM-dd")
        } else {
            date = nil
        }
        let startTimeString = try values.decode(String.self, forKey: .startTime)
        startTime = startTimeString.date(format: "HH:mm:ss")
        let endTimeString = try values.decode(String.self, forKey: .endTime)
        endTime = endTimeString.date(format: "HH:mm:ss")
        
    }
}
