//
//  UserData.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 18/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import HealthKit

final class UserData: ObservableObject  {
    @Published var showFavoritesOnly = false
    @Published var drinks = drinkData
    @Published var shouldViewOnboarding = true
    @Published var currentBac = 0.13
    @Published var bodyMass = 50
}

func getAgeSexAndBloodType() throws -> (HKBiologicalSex) {
    
  let healthKitStore = HKHealthStore()
    
  do {

    //1. This method throws an error if these data are not available.
    let biologicalSex =       try healthKitStore.biologicalSex()
    
    //2. Unwrap the wrappers to get the underlying enum values.
    let unwrappedBiologicalSex = biologicalSex.biologicalSex
      
    return (unwrappedBiologicalSex)
  }
}

