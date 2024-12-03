//
//  CreditsView.swift
//  P07-Afrika
//
//  Created by Yuriy Gudimov on 03.12.24.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
            Copyright © Yuriy Gudimov
            All Rights Reserved
            Better Apps ♡ Less Code
            """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        } //: VSTACK
        .padding()
        .opacity(0.4)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CreditsView()
        .padding()
}
