//
//  DrinkRow.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 18/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import SwiftUI

struct DrinkRow: View {
    var drink: Drink
    
    var body: some View {
        HStack {
//            drink.image
//                .resizable()
//                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(drink.name)
                Text(drink.category.rawValue)
                    .font(.footnote)
            }
            Spacer()
            Image(drink.getIcon()).resizable().frame(width: 40.0, height: 60.0)
            
//            if drink.isFavorite {
//                Image(systemName: "star.fill")
//                    .imageScale(.medium).foregroundColor(.yellow)
//            }
        }
        
    }
}

struct DrinkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DrinkRow(drink: drinkData[0])
            DrinkRow(drink: drinkData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
