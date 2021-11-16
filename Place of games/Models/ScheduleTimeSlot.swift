//
//  ScheduleTimeSlot.swift
//  Place of games
//
//  Created by Natalia on 12.11.2021.
//

import Foundation

struct ScheduleTimeSlot {
    let startTime: Date
    let durationInMinutes: Int
    var busy: Bool
    var selected = false
    
    var endTime: Date {
        return Calendar.current.date(byAdding: DateComponents(minute: durationInMinutes), to: startTime)!
    }
}
