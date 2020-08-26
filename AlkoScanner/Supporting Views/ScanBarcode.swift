//
//  ScanBarcode.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 18/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import SwiftUI

struct ScanBarcode: View {
    @EnvironmentObject var userData: UserData
    var body: some View {
        
        ZStack {
            Color("GreenDark")
            VStack {
                Spacer()
                Button(action: {
                    self.userData.currentBac += 0.15
                }) {
                    Text("Add drink").font(.title)
                        .fontWeight(.bold)
                }.buttonStyle(GradientBackgroundStyle()).shadow(radius: 3)
            }.padding(.vertical, 30.0)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ScanBarcode_Previews: PreviewProvider {
    static var previews: some View {
        ScanBarcode()
    }
}

struct GradientBackgroundStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: 300, minHeight: 35)
            .padding()
            .background(Color.white)
            .foregroundColor(Color("GreenDark"))
            .cornerRadius(35)
    }
}
