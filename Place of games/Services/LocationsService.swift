//
//  LocationsService.swift
//  Place of games
//
//  Created by Natalia on 31.10.2021.
//

import Foundation

class LocationsService {
    
    private let session = URLSession(configuration: .default)
    
    func getLocations(completion: @escaping ([Place]) -> Void) {
        let request = LocationAPI.places.asURLRequest()
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            let places = try? JSONDecoder().decode([Place].self, from: data)
            completion(places ?? [])
        } .resume()
    }
  
    func locationBy(id: Int, completion: @escaping (Place) -> Void) {
        let request = API.getPlace(placeId: id).asUrlRequest()
        session.dataTask(with: request) { data, respons, error in
            guard error == nil else { return }
            guard let data = data else { return }
            let place = try! JSONDecoder().decode(Place.self, from: data)
            completion(place)
        }.resume()
    }
}
