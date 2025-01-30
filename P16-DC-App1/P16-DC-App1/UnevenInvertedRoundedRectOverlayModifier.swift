//
//  UnevenInvertedRoundedRectOverlayModifier.swift
//  P16-DC-App1
//
//  Created by Yuriy Gudimov on 30.01.25.
//

import SwiftUI

struct UnevenInvertedRoundedRectOverlayModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, bottomLeading: 0, bottomTrailing: 20, topTrailing: 0))
                    .strokeBorder(linearGradient)
            )
    }
    
    var linearGradient: LinearGradient {
        LinearGradient(colors: [.clear, .primary.opacity(0.3), .clear], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
