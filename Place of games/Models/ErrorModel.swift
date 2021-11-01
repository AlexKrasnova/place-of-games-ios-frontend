//
//  ErrorModel.swift
//  Place of games
//
//  Created by Natalia on 15.10.2021.
//

import Foundation

struct ErrorModel: Decodable, LocalizedError {
    let message: String
    let technicalDescription: String
    let errorType: String
    let timestamp = Date()
     
    var errorDescription: String? {
        message
    }
}
