//
//  DefaultGames.swift
//  GamesAround
//
//  Created by Surgeont on 07.10.2021.
//

import UIKit

class DefaultGames {
    func getGames() -> [GameModel] {
        
        return [
            GameModel(id: 1, name: "Football", time: "14:50", duration: 90, place: Place(id: 1, name: "Cort", address: "Leninsky 6"), maxNumberOfParticipants: 15, numberOfParticipants: 12, image: UIImage(named: "1111")!),
            GameModel(id: 2, name: "Baseball", time: "12:15", duration: 60, place: Place(id: 2, name: "Stadium", address: "zhukova,15"), maxNumberOfParticipants: 5, numberOfParticipants: 4, image: UIImage(named: "base")!),
            GameModel(id: 3, name: "Salki", time: "21:00", duration: 240, place: Place(id: 3, name: "Street", address: "sofiiskaya 26"), maxNumberOfParticipants: 280, numberOfParticipants: 25, image: UIImage(named: "salki")!),
            GameModel(id: 4, name: "HideAndSeek", time: "12:00", duration: 100, place: Place(id: 4, name: "Kvartira Vlada", address: "Obvodny 1"), maxNumberOfParticipants: 7, numberOfParticipants: 4, image: UIImage(named: "hide")!),
            GameModel(id: 5, name: "Football", time: "18:00", duration: 90, place: Place(id: 1, name: "Cort", address: "Leninsky 6"), maxNumberOfParticipants: 15, numberOfParticipants: 6, image: UIImage(named: "1111")!),
            GameModel(id: 6, name: "Chess", time: "18:50", duration: 500, place: Place(id: 6, name: "Veranda", address: "Pomorskaya-8"), maxNumberOfParticipants: 2, numberOfParticipants: 1, image: UIImage(named: "chess")!)
            
            
        ]
        
    }
}
