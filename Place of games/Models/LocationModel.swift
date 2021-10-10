//
//  LocationModel.swift
//  Place of games
//
//  Created by Алёночка on 07.10.2021.
//

import UIKit

struct LocationModel {
    var name: String
    var address: String
    var photo: UIImage
    
    static func fetchLocation() -> [LocationModel] {
        let football = LocationModel(name: "Футбол", address: "ул. Кировская, 60", photo: UIImage(named: "football")!)
        let basketball = LocationModel(name: "Баскетбол", address: "ул. Тульская, 4", photo: UIImage(named: "basketball")!)
        let poker = LocationModel(name: "Покер", address: "ул. Мафиози, 12", photo: UIImage(named: "poker")!)
        
        return [football, basketball, poker]
    }
}
