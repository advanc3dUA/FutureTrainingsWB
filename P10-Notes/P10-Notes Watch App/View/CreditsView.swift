//
//  CreditsView.swift
//  P10-Notes Watch App
//
//  Created by Yuriy Gudimov on 06.12.24.
//

import SwiftUI

struct CreditsView: View {
    @State private var randomNumber = Int.random(in: 1..<4)
    private var randomImage: String {
        String("developer-no\(randomNumber)")
    }
    
    var body: some View {
        VStack(spacing: 3) {
            // PROFILE IMAGE
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            // HEADER
            HeaderView(title: "Credits")
            // CONTENT
            Text("Yuriy Gudimov")
                .foregroundStyle(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .fontWeight(.light)
        } //: VSTACK
    }
}

#Preview {
    CreditsView()
}
