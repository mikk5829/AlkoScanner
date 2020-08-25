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
    
    class func getMostRecentSample(for sampleType: HKSampleType,
                                   completion: @escaping (HKQuantitySample?, Error?) -> Swift.Void) {
      
    //1. Use HKQuery to load the most recent samples.
    let mostRecentPredicate = HKQuery.predicateForSamples(withStart: Date.distantPast,
                                                          end: Date(),
                                                          options: .strictEndDate)
        
    let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate,
                                          ascending: false)
        
    let limit = 1
        
    let sampleQuery = HKSampleQuery(sampleType: sampleType,
                                    predicate: mostRecentPredicate,
                                    limit: limit,
                                    sortDescriptors: [sortDescriptor]) { (query, samples, error) in
        
        //2. Always dispatch to the main thread when complete.
        DispatchQueue.main.async {
            
          guard let samples = samples,
                let mostRecentSample = samples.first as? HKQuantitySample else {
                    
                completion(nil, error)
                return
          }
            
          completion(mostRecentSample, nil)
        }
      }
     
    HKHealthStore().execute(sampleQuery)
    }  
}
