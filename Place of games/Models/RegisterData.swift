//
//  RegisterData.swift
//  Place of games
//
//  Created by Natalia on 15.10.2021.
//

import Foundation

struct RegisterData: Encodable {
    let login: String
    let password: String
    let name: String
}
