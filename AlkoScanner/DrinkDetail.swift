//
//  DrinkDetail.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 18/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import SwiftUI

struct DrinkDetail: View {
    @EnvironmentObject var userData: UserData
    var drink: Drink
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(drink.name)
                    .font(.title)
                
    //            Button(action: {
    //                self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
    //            }) {
    //                if self.userData.landmarks[self.landmarkIndex].isFavorite {
    //                    Image(systemName: "star.fill")
    //                        .foregroundColor(Color.yellow)
    //                } else {
    //                    Image(systemName: "star")
    //                        .foregroundColor(Color.gray)
    //                }
    //            }
            }
            
            HStack(alignment: .top) {
                Text(drink.category.rawValue)
                    .font(.subheadline)
                Spacer()
                Text(drink.isFavorite.description)
                    .font(.subheadline)
            }
        }.navigationBarTitle(Text(drink.name), displayMode: .inline)
    }
}

struct DrinkDetail_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetail(drink: drinkData[0])
    }
}
