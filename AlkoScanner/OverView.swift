//
//  OverView.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 18/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import SwiftUI

struct OverView: View {
    @EnvironmentObject var userData: UserData
    @State var testAction = false
    @State var openBarcodeView = false
    @State var testSheet = true
    
    var body: some View {
        NavigationView {
            VStack {
                Text(String(format: "%.2f", userData.currentBac))
                    .font(Font.custom("Gill-sans-light", size: 90.0))
                Spacer()
                HStack {
                    Button(action: {self.openBarcodeView.toggle()}) {
                        Image(systemName: "barcode.viewfinder")
                            .imageScale(.large)
                    }
                    Spacer()
                    NavigationLink(destination: DrinkList()){
                        Image(systemName: "list.dash")
                        .imageScale(.large)
                    }
                }.padding()
                }.navigationBarTitle(Text("Overview")).sheet(isPresented: $openBarcodeView) {
                ScanBarcode()
            }
        }.sheet(isPresented: $userData.shouldViewOnboarding) {
            Onboarding().environmentObject(UserData())
        }
    }
}

struct OverView_Previews: PreviewProvider {
    static var previews: some View {
        OverView().environmentObject(UserData())
    }
}
