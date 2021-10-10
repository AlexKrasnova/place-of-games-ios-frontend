//
//  EventService.swift
//  Place of games
//
//  Created by Natalia on 10.10.2021.
//

import Foundation

class EventService {
    
    func getEvents(completion: @escaping ([Game]) -> Void) {
        let request = API.getEvents.asUrlRequest()
        URLSession(configuration: .default).dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            let games = try! JSONDecoder().decode([Game].self, from: data)
            completion(games)
        }.resume()
    }
    
    func signUp(game: Game, completion: () -> Void) {
        
    }
}
