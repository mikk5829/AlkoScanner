//
//  AddDrink.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 26/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import SwiftUI

struct AddDrink: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack {
            HStack {
                DrinkButton(drink: drinkData[0]).environmentObject(self.userData)
                DrinkButton(drink: drinkData[0]).environmentObject(self.userData)
            }
            HStack {
                DrinkButton(drink: drinkData[1]).environmentObject(self.userData)
                DrinkButton(drink: drinkData[1]).environmentObject(self.userData)
            }
        }
    }
}

struct AddDrink_Previews: PreviewProvider {
    static var previews: some View {
        AddDrink()
    }
}
