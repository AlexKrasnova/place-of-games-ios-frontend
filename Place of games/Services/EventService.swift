//
//  EventService.swift
//  Place of games
//
//  Created by Natalia on 10.10.2021.
//

import Foundation

class EventService {
   
    let session = URLSession(configuration: .default)
    
    func getEvents(completion: @escaping ([Event]) -> Void) {
        let request = API.getEvents.asUrlRequest()
        session.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(DateFormatter.formatter(format: "yyyy-MM-dd'T'HH:mm:ss"))
            let games = try! decoder.decode([Event].self, from: data)
            completion(games)
        }.resume()
    }
    
    func getEventBy(id: Int, completion: @escaping (Event) -> Void) {
        let request = API.eventBy(id: id).asUrlRequest()
        session.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            guard let data = data else { return }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(DateFormatter.formatter(format: "yyyy-MM-dd'T'HH:mm:ss"))
            let games = try! decoder.decode(Event.self, from: data)
            completion(games)
        }.resume()
    }
    
    func participate(mebership: Bool, game: Event, completion: @escaping () -> Void) {
        let request = mebership ? API.postParticipants(eventId: game.id) : API.deleteParticipants(eventId: game.id)
        session.dataTask(with: request.asUrlRequest()) { _, response, error in
            guard error == nil else { return }
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200
            else { return }
            completion()
        }.resume()
    }
    
    func create(event: Event, completion: @escaping () -> Void) {
        let request = API.postEvent(event: event).asUrlRequest()
        session.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 201
            else { return }
            completion()
        }.resume()
    }
    
    func modifyEvent(event: Event, completion: @escaping () -> Void) {
        let request = API.putEvent(event: event).asUrlRequest()
        session.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200
            else { return }
            completion()
        }.resume()
    }
    
    func getMyEvents(completion: @escaping () -> Void) {
        let request = API.getMyEvents.asUrlRequest()
        session.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200
            else { return }
            //TODO: complete after saving new and participating events
//            let events = try! JSONDecoder().decode([Game], from: data!)
            completion()
        }.resume()
    }
    
    
    
//    func getParticipatingEvents(completion: @escaping () -> Void) {
//        let request = API.postParticipants(eventId: game.id).asUrlRequest()
//        session.dataTask(with: request) { _, response, error in
//            guard error == nil else { return }
//            guard let httpResponse = response as? HTTPURLResponse,
//                  httpResponse.statusCode == 200
//            else { return }
//            completion()
//        }.resume()
//    }

}

