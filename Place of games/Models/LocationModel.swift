//
//  LocationModel.swift
//  Place of games
//
//  Created by Алёночка on 07.10.2021.
//

import UIKit

struct LocationModel {
    let id: Int
    var name: String
    var address: String
    var photo: UIImage
    
    
    static func fetchLocation() -> [LocationModel] {
        let football = LocationModel(id: 1, name: "Футбол", address: "ул. Кировская, 60", photo: UIImage(named: "football")!)
        let basketball = LocationModel(id: 2, name: "Баскетбол", address: "ул. Тульская, 4", photo: UIImage(named: "basketball")!)
        let poker = LocationModel(id: 3, name: "Покер", address: "ул. Мафиози, 12", photo: UIImage(named: "poker")!)
        
        return [football, basketball, poker]
    }
}
