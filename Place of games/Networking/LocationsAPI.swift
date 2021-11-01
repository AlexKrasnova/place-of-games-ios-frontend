//
//  PlaygroundsAPI.swift
//  Place of games
//
//  Created by Алёночка on 27.10.2021.
//

import Foundation

enum LocationAPI {
    
    case places
    
    var method: String {
        switch self {
        case .places:
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
        }
    }
    
    func asURLRequest() -> URLRequest {
        var url = URL(string: baseUrl)!
        url.appendPathComponent(path)
        
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

