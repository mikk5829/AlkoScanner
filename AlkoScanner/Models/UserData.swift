//
//  UserData.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 18/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import Combine
import SwiftUI

/// Model for storing session data, ObservableObject updates every view it is linked to, when changes occur.
class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var drinks = drinkData
    @Published var shouldViewOnboarding = true
    @Published var currentBac = 0.03
    @Published var userHealthProfile = UserHealthProfile()
}
