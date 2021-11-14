//
//  EventService.swift
//  Place of games
//
//  Created by Natalia on 10.10.2021.
//

import Foundation

class EventService {
   
    let session = URLSession(configuration: .default)
    
    private func decodeGames(_ data: Data, completion: @escaping ([Game]) -> Void) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.formatter(format: "yyyy-MM-dd'T'HH:mm:ss"))
        let games = try! decoder.decode([Game].self, from: data)
        completion(games)
    }
    
    func getEvents(completion: @escaping ([Game]) -> Void) {
        let request = API.getEvents.asUrlRequest()
        session.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            self.decodeGames(data, completion: completion)
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
    
    func create(event: Game, completion: @escaping () -> Void) {
        let request = API.postEvent(event: event).asUrlRequest()
        session.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 201
            else { return }
            completion()
        }.resume()
    }
    
    func getMyEvents(completion: @escaping ([Game]) -> Void) {
        let request = API.getMyEvents.asUrlRequest()
        session.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200,
                  let data = data
            else { return }
            self.decodeGames(data, completion: completion)
        }.resume()
    }
    
    func getParticipatingEvents(completion: @escaping ([Game]) -> Void) {
        let request = API.getParticipatingEvents.asUrlRequest()
        session.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200,
                  let data = data
            else { return }
            self.decodeGames(data, completion: completion)
        }.resume()
    }

}

