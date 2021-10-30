//
//  EventService.swift
//  Place of games
//
//  Created by Natalia on 10.10.2021.
//

import Foundation

class EventService {
   
    let session = URLSession(configuration: .default)
    
    func getEvents(completion: @escaping ([Game]) -> Void) {
        let request = API.getEvents.asUrlRequest()
        session.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            let games = try! JSONDecoder().decode([Game].self, from: data)
            completion(games)
        }.resume()
    }
    
    func signUp(game: Game, completion: @escaping () -> Void) {
        let request = API.postParticipants(eventId: game.id).asUrlRequest()
        session.dataTask(with: request) { _, response, error in
            guard error == nil else { return }
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200
            else { return }
            completion()
        }.resume()
    }

}

//func signUp(game: Game, completion: @escaping () -> Void) {
//    let request = API.postParticipants(eventId: game.id).asUrlRequest()
//    session.dataTask(with: request) { _, response, error in
//        guard error == nil else { return }
//        guard let httpResponse = response as? HTTPURLResponse,
//              httpResponse.statusCode == 200
//        else { return }
//        completion()
//    }.resume()
//}
