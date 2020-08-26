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
    @State var showingAddDrink = false

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
            HStack {
                Spacer()
                Button(action: {
                    self.showingAddDrink = true
                }) {
                    Text("Add drink")
                        .fontWeight(.bold)
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                }
            }.padding()
        }.sheet(isPresented: $showingAddDrink) {
            AddDrink().environmentObject(self.userData)
        }
    }
}

struct DrinkList_Previews: PreviewProvider {
    static var previews: some View {
        DrinkList().environmentObject(UserData())
    }
}
