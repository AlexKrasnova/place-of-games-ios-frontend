//
//  DateFormatter+Extension.swift
//  Place of games
//
//  Created by Natalia on 07.11.2021.
//

import Foundation

extension DateFormatter {
    static func formatter(format: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
}
