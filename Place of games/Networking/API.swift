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
    
    var method: String {
        switch self {
        case .getEvents:
            return "GET"
        case .postParticipants:
            return "POST"
        }
    }
    
    var baseUrl: String {
        "http://localhost:8089/api/v1"
    }
    
    var path: String {
        switch self {
        case .getEvents:
            return "events"
        case .postParticipants(let eventId):
            return "events/\(eventId)/participants"
        }
    }
    
    func asUrlRequest() -> URLRequest {
        var url = URL(string: baseUrl)!
        url.appendPathComponent(path)
        
        var request = URLRequest(url: url)
        
        return request
    }
}


