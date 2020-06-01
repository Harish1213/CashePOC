//
//  EmployModel.swift
//  CachePOC
//
//  Created by Harsh Rajput on 01/06/20.
//  Copyright © 2020 Harsh Rajput. All rights reserved.
//

import Foundation
import Cache


import Foundation

// MARK: - WelcomeElement
struct Coffee: Codable {
    let id: String
    let v: Int
    let coffeeNames: [CoffeeName]
    let name: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case v = "__v"
        case coffeeNames, name
    }
}

// MARK: - CoffeeName
struct CoffeeName: Codable {
    let name: String
}

typealias Coffees = [Coffee]


