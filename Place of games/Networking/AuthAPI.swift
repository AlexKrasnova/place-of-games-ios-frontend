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
    case user
    
    var method: String {
        switch self {
        case .token, .register:
            return "POST"
        case .user:
            return "GET"
        }
    }
        
    var baseUrl: String {
        "http://localhost:8080/api/v1/"
    }
    
    var path: String {
        switch self {
        case .token:
            return "tokens"
        case .register:
            return "users"
        case .user:
            return "user"
        }
    }
    
    func asURLRequest() -> URLRequest {
        var url = URL(string: baseUrl)!
        url.appendPathComponent(path)
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        var httpBody: Data?
        switch self {
        case .token(let data):
            httpBody = try! JSONEncoder().encode(data)
        case .register(let data):
            httpBody = try! JSONEncoder().encode(data)
        case .user:
            if let token = AuthService.shared.token {
                request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            }
        }
        
        if let httpBody = httpBody {
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = httpBody
        }
        return request
    }
}
