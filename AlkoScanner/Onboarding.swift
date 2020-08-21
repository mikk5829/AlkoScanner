//
//  Onboarding.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 18/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import SwiftUI
import HealthKit
import HealthKitUI

struct Onboarding: View {
    @EnvironmentObject var userData: UserData
    private var distanceBetweenText: CGFloat = 19.0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("Background"), Color("BackgroundDark")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    Image("AppleHealthIcon").resizable().frame(width: 70.0, height: 70.0).shadow(radius: 3)
                
                VStack {
                    Text("Automatically sync information with Apple Health")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                }.font(.largeTitle)
                    Spacer()
                        .frame(height: distanceBetweenText)
                    Text("Using AlcoScanner with the Apple Healt app on your iPhone empowers you to better manage your health. You will get an overview of all your health data including data from AlcoScanner, so you can track habits in one convenient place.").font(.headline).fontWeight(.regular).foregroundColor(Color.white).padding(.trailing, 30.0)
                }
                Spacer()
                Button(action: { HealthKitSetupAssistant.authorizeHealthKit { (authorized, error) in
                      
                  guard authorized else {
                        
                    let baseMessage = "HealthKit Authorization Failed"
                        
                    if let error = error {
                      print("\(baseMessage). Reason: \(error.localizedDescription)")
                    } else {
                      print(baseMessage)
                    }
                        
                    return
                  }
                      
                  print("HealthKit Successfully Authorized.")
                }

                }) {
                    Text("Sync Health Data")
                        .font(.title)
                        .fontWeight(.semibold)
                }.buttonStyle(GradientBackgroundStyle()).shadow(radius: 3)
                Spacer()
                    .frame(height: distanceBetweenText)
                Button(action: {
                   
                    self.userData.shouldViewOnboarding = false
                    print(self.userData.shouldViewOnboarding)
                }) {
                    Text("Enter manually")
                        .font(.headline)
                        .foregroundColor(Color.white)
                }
            }.padding(28.0)

        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding().environmentObject(UserData())
    }
}

//var body: some View {
//    VStack {
//        Spacer()
//        VStack {
//            Text("Welcome to").fontWeight(.black)
//            Text("AlcoScanner").fontWeight(.black).foregroundColor(.orange)
//        }.font(.largeTitle)
//        Spacer()
//        InfoBox(heading: "Health", text: "This is a long paragraph this is a long paragraph this is a long paragraph", icon: "heart.fill")
//        InfoBox(heading: "Scan", text: "This is a long paragraph this is a long paragraph this is a long paragraph", icon: "barcode.viewfinder")
//        InfoBox(heading: "Scan", text: "This is a long paragraph this is a long paragraph this is a long paragraph", icon: "checkmark.square")
//        Spacer()
//        Button(action: { self.userData.shouldViewOnboarding = false
//            print(self.userData.shouldViewOnboarding)
//        }) {
//            Text("Continue")
//                .font(.headline)
//        }.buttonStyle(GradientBackgroundStyle())
//    }
//}
