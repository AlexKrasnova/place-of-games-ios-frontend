//
//  API.swift
//  Place of games
//
//  Created by Natalia on 10.10.2021.
//

import Foundation

enum API {
    case getEvents
    case postParticipants(eventId: Int)
    case deleteParticipants(eventId: Int)
    case getPlace(placeId: Int)
    case postEvent(event: Event)
    case putEvent(event: Event)
    case getMyEvents
    case getParticipatingEvents
    case user
	case eventBy(id: Int)
    
    var method: String {
        switch self {
        case .getEvents, .getPlace, .getMyEvents, .getParticipatingEvents, .user, .eventBy:
            return "GET"
        case .postParticipants, .postEvent:
            return "POST"
        case .deleteParticipants:
            return "DELETE"
        case .putEvent:
            return "PUT"
        }
    }
    
    var baseUrl: String {
        "http://localhost:8080/api/v1"
    }
    
    var path: String {
        switch self {
        case .getEvents, .postEvent:
            return "events"
        case .postParticipants(let eventId), .deleteParticipants(let eventId):
            return "events/\(eventId)/participants"
        case .getPlace(let placeId):
            return "places/\(placeId)"
        case .getMyEvents:
            return "user/owned-events"
        case .getParticipatingEvents:
            return "user/events-to-participate"
        case .user:
            return "user"
        case .eventBy(let eventId):
            return "events/\(eventId)"
        case .putEvent(let event):
            return "events/\(event.id)"
            
        }
    }
    
    func asUrlRequest() -> URLRequest {
        var url = URL(string: baseUrl)!
        url.appendPathComponent(path)
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        if let token = AuthService.shared.token {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        switch self {
        case .postEvent(let event), .putEvent(let event):
            let data = try! JSONEncoder().encode(event)
            request.httpBody = data
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        default:
            break
        }
        
        return request
    }
}


