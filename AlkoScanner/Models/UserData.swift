//
//  UserData.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 18/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import Combine
import SwiftUI
import HealthKit

/// Model for storing session data, ObservableObject updates every view it is linked to, when changes occur.
class UserData: ObservableObject {
    let defaults = UserDefaults.standard
    
    @Published var showFavoritesOnly = false
    @Published var drinks = drinkData
    @Published var shouldViewOnboarding = false
    @Published var currentBac = 0.15
    @Published var weightInKilograms = 0.0
    @Published var biologicalSex = HKBiologicalSex.male
    @Published var currentDrinks:[Drink] = []
}

//func getBiologicalSex() throws -> (HKBiologicalSex) {
//
//  let healthKitStore = HKHealthStore()
//
//  do {
//    //1. This method throws an error if these data are not available.
//    let biologicalSex = try healthKitStore.biologicalSex()
//
//    //2. Unwrap the wrappers to get the underlying enum values.
//    let unwrappedBiologicalSex = biologicalSex.biologicalSex
//
//    return (unwrappedBiologicalSex)
//  }
//}

