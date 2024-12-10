//
//  BetNumberModifier.swift
//  P12-SlotMachine
//
//  Created by Yuriy Gudimov on 10.12.24.
//

import SwiftUI

struct BetNumberModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .rounded, weight: .heavy))
            .padding(.vertical, 20)
            .frame(width: 90)
            .shadow(color: .colorTransparentBlack, radius: 0, x: 0, y: 3)
    }
}

extension View {
    func betNumberModifier() -> some View {
        modifier(BetNumberModifier())
    }
}
