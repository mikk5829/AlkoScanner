//
//  ProfileDataStore.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 21/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import Foundation
import HealthKit

class ProfileDataStore {
    class func getbiologicalSex() throws -> (HKBiologicalSex) {
        
      let healthKitStore = HKHealthStore()
        
      do {

        //1. This method throws an error if these data are not available.
        let biologicalSex = try healthKitStore.biologicalSex()
         
        //2. Unwrap the wrappers to get the underlying enum values.
        let unwrappedBiologicalSex = biologicalSex.biologicalSex
        
          
        return (unwrappedBiologicalSex)
      }
    }

  
}
