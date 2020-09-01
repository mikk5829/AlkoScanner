//
//  DrinkButton.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 26/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import SwiftUI
import HealthKit

struct DrinkButton: View {
    /// Calculated from https://www.sundhed.dk/borger/patienthaandbogen/psyke/sygdomme/alkohol/alkoholpromille-beregning/
    func getBac() -> Float {
        let gramsOfAlcohol: Float = drink.gramsOfAlcohol()
        let weightInKilogram: Float = Float(userData.weightInKilograms)
        let biologicalSex = userData.biologicalSex
        let bac = gramsOfAlcohol /  (weightInKilogram * (biologicalSex == HKBiologicalSex.male ? 0.7 : 0.6))
        return bac
    }

    var drink: Drink
    @EnvironmentObject var userData: UserData
    
    var body: some View {
            Button(action: {
                self.userData.currentDrinks.append(self.drink)
                self.userData.currentBac += Double(self.getBac())
                }) {
            HStack {
                VStack(alignment: .leading) {
                            Spacer()
                            Text(drink.category.rawValue)
                                .font(.headline)
                                .foregroundColor(Color.white)
                    Text(String(format: "%.2f", drink.gramsOfAlcohol())).font(.headline)
                    .foregroundColor(Color.white)
                }.padding()
                Spacer()
                Image(drink.getIcon()).resizable().frame(width: 50.0, height: 70.0)
            }
        }.buttonStyle(DrinkPickerStyle(color: drink.color()))
    }
}

struct DrinkButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DrinkButton(drink: drinkData[0])
            DrinkButton(drink: drinkData[1])
        }.previewLayout(.fixed(width: 300, height: 150))
    }
}
