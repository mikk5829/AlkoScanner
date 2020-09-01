//
//  CustomButtons.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 30/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import SwiftUI

struct CustomButtons: View {
    var body: some View {
        VStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            Text("Button")
            }.buttonStyle(GradientBackgroundStyle())
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Button")
                }.buttonStyle(DrinkPickerStyle(color: "Green"))
            }
        }
}

struct CustomButtons_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtons()
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

struct DrinkPickerStyle: ButtonStyle {
    var color:String
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 100, minHeight: 120, maxHeight: 120)
            .padding()
            .background(Color(color))
            .foregroundColor(Color.white)
            .cornerRadius(15)
    }
}
