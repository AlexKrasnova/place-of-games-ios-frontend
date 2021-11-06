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
    var userInfo: UserInfoData?
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
    
    private init() { }
    
    let session = URLSession(configuration: .default)
    
    private func request(_ request: URLRequest, successStatusCode: Int, completion: @escaping (Data?, ErrorModel?) -> Void) {
        session.dataTask(with: request, completionHandler: { (data, response, error) in
            guard error == nil else {
                let error = ErrorModel(
                    message: error!.localizedDescription,
                    technicalDescription: "local error",
                    errorType: "local"
                )
                completion(nil, error)
                return
            }
            let httpResponse = response as! HTTPURLResponse
            guard httpResponse.statusCode == successStatusCode else {
                let error = try! JSONDecoder().decode(ErrorModel.self, from: data!)
                completion(nil, error)
                return
            }
            completion(data, nil)
        }).resume()
    }
    
    func login(login: String, password: String, completion: @escaping (ErrorModel?) -> Void) {
        let authData = AuthData(login: login, password: password)
        let request = AuthAPI.token(data: authData).asURLRequest()
        self.request(request, successStatusCode: 200) { data, error in
            guard error == nil else { return completion(error) }
            let authResponse = try! JSONDecoder().decode(AuthResponse.self, from: data!)
            self.token = authResponse.token
            self.getUserInfo { (userInfo, error) in
                self.userInfo = userInfo
            }
            completion(nil)
        }
    }
    
    func register(login: String, password: String, name: String, completion: @escaping (ErrorModel?) -> Void) {
        let registerData = RegisterData(login: login, password: password, name: name)
        let request = AuthAPI.register(data: registerData).asURLRequest()
        self.request(request, successStatusCode: 201) { data, error in
            completion(error)
        }
    }
    
    func getUserInfo(completion: @escaping (UserInfoData?, ErrorModel?) -> Void) {
        let request = API.user.asUrlRequest()
        self.request(request, successStatusCode: 200) { data, error in
            guard error == nil else { return completion(nil, error) }
            let userInfo = try! JSONDecoder().decode(UserInfoData.self, from: data!)
            completion(userInfo, nil)
        }
    }
}
