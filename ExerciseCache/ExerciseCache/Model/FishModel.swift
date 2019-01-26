//
//  FishModel.swift
//  ExerciseCache
//
//  Created by Guerrero Azpitarte Adrian on 06/10/18.
//  Copyright © 2018 Guerrero Azpitarte Adrian. All rights reserved.
//

import Foundation


struct Fish: Decodable {
    let id: String?
    let name: String
    let text: String
    let apiUrlString: String?
    let webUrlString: String?
    let imageUrlString: String?
}
