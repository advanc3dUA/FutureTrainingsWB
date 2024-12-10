//
//  ScoreNumberModifier.swift
//  P12-SlotMachine
//
//  Created by Yuriy Gudimov on 10.12.24.
//

import SwiftUI

struct ScoreNumberModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .colorTransparentBlack, radius: 0, x: 0, y: 3)
            .layoutPriority(1)
    }
}

extension View {
    func scoreNumberModifier() -> some View {
        modifier(ScoreNumberModifier())
    }
}
