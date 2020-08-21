//
//  HKBiologicalSex.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 21/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import HealthKit

extension HKBiologicalSex {
  
  var stringRepresentation: String {
    switch self {
    case .notSet: return "Unknown"
    case .female: return "Female"
    case .male: return "Male"
    case .other: return "Other"
    @unknown default:
        return "Unknown"
    }
  }
}
