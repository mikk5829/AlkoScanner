//
//  UserHealthProfile.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 21/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import HealthKit

/// Model for storing healt information about the user
class UserHealthProfile {
  var biologicalSex: HKBiologicalSex?
  var weightInKilograms: Double?
}
