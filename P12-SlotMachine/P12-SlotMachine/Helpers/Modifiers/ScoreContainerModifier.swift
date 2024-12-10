//
//  ScoreContainerModifier.swift
//  P12-SlotMachine
//
//  Created by Yuriy Gudimov on 10.12.24.
//

import SwiftUI

struct ScoreContainerModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 4)
            .padding(.horizontal, 16)
            .frame(minWidth: 128)
            .background(
                Capsule()
                    .foregroundStyle(.colorTransparentBlack)
            )
    }
}

extension View {
    func scoreContainerModifier() -> some View {
        modifier(ScoreContainerModifier())
    }
}
