//
//  ScanBarcode.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 18/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import SwiftUI
import CodeScanner

struct ScanBarcode: View {
    @EnvironmentObject var userData: UserData
    
    @Binding var showingSheet:Bool
    
    var body: some View {
        ZStack {
        CodeScannerView(
            codeTypes: [.ean13, .upce],
            completion: { result in
                if case let .success(code) = result {
                    let drink = userData.drinks.first {$0.id == code}
//                    print(drink?.getBac(userHealthProfile: userData.userHealthProfile) as Any)
//                    print(drink?.alcoholInGrams() as Any)
//                    print(drink?.name as Any)
//                    print(code)
                    userData.currentBac += Double((drink?.getBac(userHealthProfile: userData.userHealthProfile))!)
                    self.showingSheet = false
                }
            }
        ).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("Scan a barcode")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                    .padding(.bottom)
            }
        }
    }
}

struct ScanBarcode_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            Text("Scan a barcode")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
        }
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
