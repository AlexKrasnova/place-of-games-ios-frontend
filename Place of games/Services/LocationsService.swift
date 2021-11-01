//
//  PlaygroundService.swift
//  Place of games
//
//  Created by Алёночка on 27.10.2021.
//

import Foundation

class LocationsService {
    
    private let session = URLSession(configuration: .default)
    
    func getLocations(completion: @escaping ([LocationModel]) -> Void) {
        let request = LocationAPI.places.asURLRequest()
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            let places = try? JSONDecoder().decode([LocationModel].self, from: data)
            completion(places ?? [])
        } .resume()
    }
}













