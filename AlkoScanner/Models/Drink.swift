//
//  Drink.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 17/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//
import HealthKit
import Foundation

struct Drink: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var category: Category
    var isFavorite: Bool
    var alcoholPercent: Float
    var contentInMl: Float
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case beer = "Beer"
        case wine = "Wine"
        case liquor = "Liquor"
        case cider = "Cider"
        case drinks = "Drinks"
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
    
    /// From https://en.wikipedia.org/wiki/Standard_drink#Calculation_of_pure_alcohol_mass_in_a_serving
    func alcoholInGrams() -> Float {
        return (contentInMl * (alcoholPercent/100) * 0.78924)
    }
    
    /// From https://www.sundhed.dk/borger/patienthaandbogen/psyke/sygdomme/alkohol/alkoholpromille-beregning/
    func getBac(userHealthProfile:UserHealthProfile) -> Float {
        userHealthProfile.biologicalSex == HKBiologicalSex.male ?
            alcoholInGrams()/(Float(userHealthProfile.weightInKilograms!)*0.7) : alcoholInGrams()/(Float(userHealthProfile.weightInKilograms!)*0.6)
    }
}
