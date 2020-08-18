//
//  Drink.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 17/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import Foundation

struct Drink: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var category: Category
    var isFavorite: Bool
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case beer = "Beer"
        case wine = "Wine"
        case liquor = "Liquor"
        case cider = "Cider"
        case drinks = "Drinks"
    }
}
