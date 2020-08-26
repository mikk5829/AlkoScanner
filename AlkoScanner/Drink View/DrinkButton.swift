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
    func addDrink() {
        let gramsOfAlcohol: Float = drink.gramsOfAlcohol()
        let weightInKilogram: Float = Float(userData.weightInKilograms)
        let biologicalSex = userData.biologicalSex
        print(gramsOfAlcohol /  (weightInKilogram * (biologicalSex == HKBiologicalSex.male ? 0.7 : 0.6)))
    }

    var drink: Drink
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        ZStack {
            Color(drink.color())
            Button(action: {
                self.addDrink()
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
            }.overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 10)
            )
        }
        }
        
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
