//
//  Country.swift
//  Worldb
//
//  Created by Guerrero Azpitarte Adrian on 29/09/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import UIKit

//codable es un typealias

//typealias Codable = Decodable & Encodable
struct Country: Codable, Decodable {
    let id: Int
    let name: StaticString
    let code: String
    let languages: [String]
    
}


func save(decodable)
