//
//  LogoView.swift
//  P08-Touchdown
//
//  Created by Yuriy Gudimov on 04.12.24.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack(spacing: 4) {
            Text("Touch".uppercased())
                .font(.title3)
                .foregroundStyle(.black)
                .fontWeight(.black)
            
            Image("logo-dark")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30, alignment: .center)
            
            Text("Down".uppercased())
                .font(.title3)
                .foregroundStyle(.black)
                .fontWeight(.black)
        } //: HSTACK
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    LogoView()
        .padding()
}
