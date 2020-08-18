//
//  Onboarding.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 18/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import SwiftUI

struct Onboarding: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("Welcome to").fontWeight(.black)
                Text("AlcoScanner").fontWeight(.black).foregroundColor(.orange)
            }.font(.largeTitle)
            Spacer()
            InfoBox(heading: "Health", text: "This is a long paragraph this is a long paragraph this is a long paragraph", icon: "heart.fill")
            InfoBox(heading: "Scan", text: "This is a long paragraph this is a long paragraph this is a long paragraph", icon: "barcode.viewfinder")
            InfoBox(heading: "Scan", text: "This is a long paragraph this is a long paragraph this is a long paragraph", icon: "checkmark.square")
            Spacer()
            Button(action: { self.userData.shouldViewOnboarding = false
                print(self.userData.shouldViewOnboarding)
            }) {
                Text("Continue")
                    .font(.headline)
            }.buttonStyle(GradientBackgroundStyle())
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding().environmentObject(UserData())
    }
}
