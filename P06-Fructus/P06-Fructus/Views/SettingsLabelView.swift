//
//  SettingsLabelView.swift
//  P06-Fructus
//
//  Created by Yuriy Gudimov on 29.11.24.
//

import SwiftUI

struct SettingsLabelView: View {
    //MARK: - PROPERTIES
    let labelText: String
    let labelImage: String
    
    //MARK: - BODY
    var body: some View {
        HStack {
            Text(labelText.uppercased())
                .fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

//MARK: - PREVIEW
#Preview(traits: .sizeThatFitsLayout) {
    SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
        .padding()
}
