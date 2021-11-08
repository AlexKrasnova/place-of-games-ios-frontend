//
//  Date+Format.swift
//  Place of games
//
//  Created by Natalia on 07.11.2021.
//

import Foundation

extension Date {
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
