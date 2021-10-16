//
//  AuthAPI.swift
//  Place of games
//
//  Created by Natalia on 14.10.2021.
//

import Foundation

enum AuthAPI {
    case token(data: AuthData)
    case register(data: RegisterData)
    
    var metod: String {
        switch self {
        case .token, .register:
            return "POST"
        
        }
    }
        
    var baseUrl: String {
        "http://localhost:8080/api/v1"
    }
    
    var path: String {
        switch self {
        case .token:
            return "tokens"
        case .register:
            return "users"
        }
    }
    
    func asURLRequest() -> URLRequest {
        var url = URL(string: baseUrl)!
        url.appendPathComponent(path)
        
        var request = URLRequest(url: url)
        var httpBody: Data?
        switch self {
        case .token(let data):
            httpBody = try! JSONEncoder().encode(data)
        case .register(let data):
            httpBody = try! JSONEncoder().encode(data)
        }
        
        if let httpBody = httpBody {
            request.httpBody = httpBody
        }
        return request
    }
}
