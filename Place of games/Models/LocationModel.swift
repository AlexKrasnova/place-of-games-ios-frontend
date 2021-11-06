//
//  LocationModel.swift
//  Place of games
//
//  Created by Алёночка on 07.10.2021.
//

import UIKit

struct LocationModel: Codable {
    var name: String
    var address: String
}

enum LocationImage: Int {
    case metalist = 1
    case kotocafe = 2
    case luzhniki = 3
    case chocolate = 4
    case chocolate2 = 5
    case bowling = 6
}
