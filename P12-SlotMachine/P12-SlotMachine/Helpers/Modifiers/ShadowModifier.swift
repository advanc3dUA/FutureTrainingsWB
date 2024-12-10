//
//  ShadowModifier.swift
//  P12-SlotMachine
//
//  Created by Yuriy Gudimov on 10.12.24.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .colorTransparentBlack, radius: 0, x: 0, y: 6)
    }
}

extension View {
    func shadowModifier() -> some View {
        modifier(ShadowModifier())
    }
}
