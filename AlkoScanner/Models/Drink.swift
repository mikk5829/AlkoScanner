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
    /// Used when deleting drink, subtract number from BAC
    var originalBac: Float
    var volumeInMl: Float
    var alcoholPercent: Float
//    var timeFinished: Date
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case beer = "Beer"
        case wine = "Wine"
        case liquor = "Liquor"
        case cider = "Cider"
        case drinks = "Drinks"
    }
    
    /// Calculates Grams of alcohol from volume, alcohol percent and dencity of alcohol
    /// - Returns: Grams of alcohol
    func gramsOfAlcohol() -> Float {
        let density:Float = 0.78924
        return volumeInMl * (alcoholPercent / 100) * density
    }
    
    /// Gets a color based on category.
    ///
    /// Remember to add color in assets
    /// - Returns: String representation of color
    func color() -> String {
        switch category {
        case .beer:
            return "Green"
        default:
            return "Background"
        }
    }
    
    func getIcon() -> String {
        switch category {
        case .beer:
            return "Glass"
        case .drinks:
            return "Matini"
        case .wine:
            return "Wine"
        case .liquor:
            return "Shot"
        case .cider:
            return "Can"
        default:
            return "Martini"
        }
    }
}
