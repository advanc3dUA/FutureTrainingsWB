//
//  ControlImageView.swift
//  P05-Pinch
//
//  Created by Yuriy Gudimov on 27.11.24.
//

import SwiftUI

struct ControlImageView: View {
    let icon: String
    
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 32))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ControlImageView(icon: "plus.magnifyingglass")
        .preferredColorScheme(.dark)
        .padding()
}
