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
    @Binding var showingSheet:Bool
    @State var scannedCode: String?

    var body: some View {
        NavigationView {
            CodeScannerView(
                codeTypes: [.ean13, .upce],
                completion: { result in
                    if case let .success(code) = result {
                        print(code) // TODO Remove debug
                        self.scannedCode = code
                        self.showingSheet = false
                    }
                }
            )
        }
    }
}

//struct ScanBarcode_Previews: PreviewProvider {
//    static var previews: some View {
//        ScanBarcode(showingSheet: true)
//    }
//}

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
