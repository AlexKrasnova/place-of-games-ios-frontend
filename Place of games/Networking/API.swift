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
    case getPlace(placeId: Int)
    
    var method: String {
        switch self {
        case .getEvents, .getPlace:
            return "GET"
        case .postParticipants:
            return "POST"
        }
    }
    
    var baseUrl: String {
        "http://localhost:8080/api/v1"
    }
    
    var path: String {
        switch self {
        case .getEvents:
            return "events"
        case .postParticipants(let eventId):
            return "events/\(eventId)/participants"
        case .getPlace(let placeId):
            return "places/\(placeId)"
        }
    }
    
    func asUrlRequest() -> URLRequest {
        var url = URL(string: baseUrl)!
        url.appendPathComponent(path)
        
        var request = URLRequest(url: url)
        if let token = AuthService.shared.token {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        return request
    }
}


