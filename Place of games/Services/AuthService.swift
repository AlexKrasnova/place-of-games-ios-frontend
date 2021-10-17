//
//  AuthService.swift
//  Place of games
//
//  Created by Natalia on 14.10.2021.
//

import Foundation

class AuthService {
    
    static let shared = AuthService()
    
    private let refreshTokenKey = "refreshTokenKey"
    var token: String?
    var refreshToken: String? {
        get {
            UserDefaults.standard.string(forKey: refreshTokenKey)
        }
        set {
            if let refreshToken = newValue {
                UserDefaults.standard.setValue(refreshToken, forKey: refreshTokenKey)
            } else {
                UserDefaults.standard.removeObject(forKey: refreshTokenKey)
            }
        }
    }
    
    private init() {}
    
    let session = URLSession(configuration: .default)
    
    func login(login: String, password: String, completion: @escaping (ErrorModel?) -> Void) {
        let authData = AuthData(login: login, password: password)
        let request = AuthAPI.token(data: authData).asURLRequest()
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(ErrorModel(message: error!.localizedDescription,
                                      technicalDescription: "local error",
                                      errorType: "local",
                                      timestamp: Date()))
                return
            }
            let httpResponse = response as! HTTPURLResponse
            guard httpResponse.statusCode == 200 else {
                let error = try! JSONDecoder().decode(ErrorModel.self, from: data!)
                completion(error)
                return
            }
            let authResponse = try! JSONDecoder().decode(AuthResponse.self, from: data!)
            self.token = authResponse.token
            completion(nil)
        }.resume()
    }
    
    func register(login: String, password: String, name: String, completion: @escaping (ErrorModel?) -> Void) {
        let registerData = RegisterData(login: login, password: password, name: name)
        let request = AuthAPI.register(data: registerData).asURLRequest()
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(ErrorModel(message: error!.localizedDescription,
                                      technicalDescription: "local error",
                                      errorType: "local",
                                      timestamp: Date()))
                return
            }
            let httpResponse = response as! HTTPURLResponse
            guard httpResponse.statusCode == 201 else {
                let error = try! JSONDecoder().decode(ErrorModel.self, from: data!)
                completion(error)
                return
            }
            completion(nil)
        }.resume()
    }
}
