//
//  PlaygroundsAPI.swift
//  Place of games
//
//  Created by Алёночка on 27.10.2021.
//

import Foundation

enum LocationAPI {
    
    case places
    case freeTime (placeId: Int, date: Date)
    
    var method: String {
        switch self {
        case .places:
            return "GET"
        case .freeTime:
            return "GET"
        }
    }
        
    var baseUrl: String {
        "http://localhost:8080/api/v1"
    }
    // путь в урле
    var path: String {
        switch self {
        case .places:
            return "places"
        case .freeTime(let placeId, _):
            return "places/\(placeId)/free-time"
        }
    }
    
    func asURLRequest() -> URLRequest {
        var url = URL(string: baseUrl)!
        url.appendPathComponent(path)
        
        
        
        switch self {
        case .freeTime(_, let date):
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
            let dateItem = URLQueryItem(name: "date", value: date.string(format: "yyyy-MM-dd"))
            components.queryItems = [dateItem]
            url = components.url!
        default:
            break
        }
        
        var request = URLRequest(url: url)
        
        // метод отправки запроса на бэк
        request.httpMethod = method
        
        // строка для бэка
        if let token = AuthService.shared.token {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        return request
    }
}

