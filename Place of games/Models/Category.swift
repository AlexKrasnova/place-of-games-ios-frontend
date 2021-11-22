//
//  Category.swift
//  Place of games
//
//  Created by Natalia on 12.10.2021.
//

import UIKit

enum Category: String, Codable, CaseIterable {
    
    case football = "FOOTBALL"
    case tennis = "TENNIS"
    case bowling = "BOWLING"
    case chess = "CHESS"
    case basketball = "BASKETBALL"
    case unknown = ""
    
    init(from decoder: Decoder) throws {
        let str = try decoder.singleValueContainer().decode(String.self)
        self = Category(rawValue: str) ?? .unknown
    }
    
    var image: UIImage {
        switch  self {
        case .football:
            return UIImage(named: "football-1")!
        case .tennis:
            return UIImage(named: "tennis")!
        case .bowling:
            return UIImage(named: "bowling")!
        case .chess:
            return UIImage(named: "chess-1")!
        case .basketball:
            return UIImage(named: "basketball-1")!
        case .unknown:
            return UIImage(named: "football")!
            
        }
    }
}


