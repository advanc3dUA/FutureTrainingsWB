//
//  FooterView.swift
//  P08-Touchdown
//
//  Created by Yuriy Gudimov on 04.12.24.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack {
            Text("We offer the most cutting edge, comfortable, lightweight and durable football helmets in the market at affordable prices.")
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(2)
            
            Image("logo-lineal")
                .renderingMode(.template)
                .foregroundStyle(.gray)
                .layoutPriority(0)
            
            Text("Copyright © 2024 Yuriy Gudimov.\nAll rights reserved.")
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .layoutPriority(1)
                
        } //: VSTACK
        .padding()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    FooterView()
        .background(.background)
        .padding()
}
