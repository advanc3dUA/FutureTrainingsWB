//
//  UnevenRoundedRectGradientOverlayModifier.swift
//  P16-DC-App1
//
//  Created by Yuriy Gudimov on 30.01.25.
//

import SwiftUI

struct UnevenRoundedRectGradientOverlayModifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 0, bottomLeading: 20, bottomTrailing: 0, topTrailing: 20))
                    .strokeBorder(linearGradient)
            )
    }
    
    var linearGradient: LinearGradient {
        LinearGradient(colors: [.clear, .primary.opacity(0.3), .clear], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
