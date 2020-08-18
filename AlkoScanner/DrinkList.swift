//
//  DrinkList.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 18/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import SwiftUI

struct DrinkList: View {
    @EnvironmentObject var userData: UserData
    @State var showingAddDrink = true

    var body: some View {
        
            VStack {
                List {
                    ForEach(userData.drinks) { drink in
                        NavigationLink(destination: DrinkDetail(drink: drink)) {
                            DrinkRow(drink: drink)
                        }
                    }
                }
                .navigationBarTitle(Text("Drinks"), displayMode: .inline)
            }
        
    }
}

struct DrinkList_Previews: PreviewProvider {
    static var previews: some View {
        DrinkList().environmentObject(UserData())
    }
}
