//
//  ScanBarcode.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 18/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import SwiftUI

struct ScanBarcode: View {
    var body: some View {
        
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            Text("Add drink")
        }.buttonStyle(GradientBackgroundStyle())
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
            .foregroundColor(Color("BackgroundDark"))
            .cornerRadius(35)
    }
}
