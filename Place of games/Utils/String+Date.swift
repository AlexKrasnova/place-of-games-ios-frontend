//
//  String+Date.swift
//  Place of games
//
//  Created by Natalia on 12.11.2021.
//

import Foundation

extension String {
    func date(format: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "RU_ru")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter.date(from: self)!
    }
}
