//
//  OverView.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 18/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import SwiftUI
import HealthKit

struct OverView: View {
    @EnvironmentObject var userData: UserData
    let defaults = UserDefaults.standard
    let userHealthProfile = UserHealthProfile()
    
    @State var testAction = false
    @State var openBarcodeView = false
    @State var testSheet = true
    
    @State var biologicalSexLabel:Text!
    @State var bodyMassText:Text!
    
    
    
    var body: some View {
        Group {
            if isHealthAuthorized() {
                Onboarding().environmentObject(userData)
            } else {
                NavigationView {
                    ZStack{
                        LinearGradient(gradient: Gradient(colors: [Color("Green"), Color("GreenDark")]), startPoint: .top, endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all)
                    VStack {
                        biologicalSexLabel
                        bodyMassText
                        Text(String(format: "%.2f", userData.currentBac) + "‰")
                            .font(Font.custom("Avenir-Roman", size: 90.0))
                            .foregroundColor(Color.white)
                            .shadow(radius: 6)
                        Spacer()
                        HStack {
                            Button(action: {
                                self.openBarcodeView.toggle()}) {
                                Image(systemName: "barcode.viewfinder")
                                    .imageScale(.large).foregroundColor(Color.white)
                            }
                            Spacer()
                            NavigationLink(destination: DrinkList()){
                                Image(systemName: "list.dash")
                                    .imageScale(.large)
                                    .foregroundColor(Color.white)
                            }
                        }.padding()
                        }.navigationBarTitle(Text("Overview")).sheet(isPresented: $openBarcodeView) {
                            ScanBarcode(showingSheet: self.$openBarcodeView)
                        }
                        
                    }
                }.onAppear{
                    self.updateHealth()
                }
            }
        }
    }
}

extension OverView {
    func isHealthAuthorized() -> Bool {
        return defaults.bool(forKey: "ShouldViewOnboarding")
    }
    
    func updateHealth() {
        updateBiologicalSex()
        updateBodyMass()
    }
    
    func updateLabels() {
        if let biologicalSex = userHealthProfile.biologicalSex {
            biologicalSexLabel = Text(biologicalSex.stringRepresentation)
        }
        if let bodyMass = userHealthProfile.weightInKilograms {
            bodyMassText = Text(String(format: "%.2f", bodyMass))
        }
    }
    
    private func updateBiologicalSex() {
        do {
            let userAgeSexAndBloodType = try ProfileDataStore.getbiologicalSex()
            userHealthProfile.biologicalSex = userAgeSexAndBloodType
            updateLabels()
        } catch let error {
            print(error)
        }
    }
    
    private func updateBodyMass() {
        guard let weightSampleType = HKSampleType.quantityType(forIdentifier: .bodyMass) else {
            print("Body Mass Sample Type is no longer available in HealthKit")
            return
        }
        
        ProfileDataStore.getMostRecentSample(for: weightSampleType) { (sample, error) in
            
            guard let sample = sample else {
                
                //            if let error = error {
                //              self.displayAlert(for: error)
                //            }
                return
            }
            
            let weightInKilograms = sample.quantity.doubleValue(for: HKUnit.gramUnit(with: .kilo))
            self.userHealthProfile.weightInKilograms = weightInKilograms
            self.updateLabels()
        }
        
    }
}

struct OverView_Previews: PreviewProvider {
    static var previews: some View {
        OverView().environmentObject(UserData())
    }
}
