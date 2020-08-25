//
//  HealthKitSetupAssistant.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 21/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//  https://www.raywenderlich.com/459-healthkit-tutorial-with-swift-getting-started
//

import HealthKit

class HealthKitSetupAssistant {
  
    private enum HealthkitSetupError: Error {
        case notAvailableOnDevice
        case dataTypeNotAvailable
    }
  
    class func authorizeHealthKit(completion: @escaping (Bool, Error?) -> Swift.Void) {
        //1. Check to see if HealthKit Is Available on this device
        guard HKHealthStore.isHealthDataAvailable() else {
          completion(false, HealthkitSetupError.notAvailableOnDevice)
          return
        }
        
        //2. Prepare the data types that will interact with HealthKit
        guard let biologicalSex = HKObjectType.characteristicType(forIdentifier: .biologicalSex),
        let bodyMass = HKObjectType.quantityType(forIdentifier: .bodyMass)
        else {
            completion(false, HealthkitSetupError.dataTypeNotAvailable)
            return
        }
        
        //3. Prepare a list of types you want HealthKit to read and write
        let healthKitTypesToWrite: Set<HKSampleType> = []
            
        let healthKitTypesToRead: Set<HKObjectType> = [biologicalSex,
                                                       bodyMass]
        
        //4. Request Authorization
        HKHealthStore().requestAuthorization(toShare: healthKitTypesToWrite, read: healthKitTypesToRead) { (success, error) in
          completion(success, error)
        }
    }
}
