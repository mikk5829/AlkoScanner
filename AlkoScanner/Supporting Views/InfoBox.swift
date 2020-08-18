//
//  InfoBox.swift
//  AlkoScanner
//
//  Created by Mikkel Rosenfeldt Anderson on 18/08/2020.
//  Copyright © 2020 Mikkel Rosenfeldt Anderson. All rights reserved.
//

import SwiftUI

struct InfoBox: View {
    var heading: String
    var text: String
    var icon: String
    
    var body: some View {
        HStack{
            Image(systemName: icon)
            .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50).foregroundColor(.orange)

            VStack(alignment: .leading) {
                Text(heading)
                    .font(.headline)
                .fontWeight(.bold)
                Text(text)
            }
            .padding(.leading, 10.0)
            Spacer()
        }.padding()
    }
    
}

struct InfoBox_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InfoBox(heading: "hej", text: "dette er en meget lang paragraf dette er en meget lang paragraf dette er en meget lang paragraf", icon: "barcode.viewfinder")
            InfoBox(heading: "hej", text: "dette er en kort paragraf", icon: "barcode.viewfinder")
        }.previewLayout(.fixed(width: 500, height: 200))
    }
}
