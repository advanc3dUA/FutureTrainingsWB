//
//  BetCapsuleModifier.swift
//  P12-SlotMachine
//
//  Created by Yuriy Gudimov on 10.12.24.
//

import SwiftUI

struct BetCapsuleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                Capsule()
                    .fill(
                        LinearGradient(colors: [.colorPink, .colorPurple], startPoint: .top, endPoint: .bottom)
                    )
                    .padding(3)
                    .background(
                        Capsule()
                            .fill(
                                LinearGradient(colors: [.colorPink, .colorPurple], startPoint: .bottom, endPoint: .top)
                            )
                            .shadowModifier()
                    )
            )
    }
}

extension View {
    func betCapsuleModifier() -> some View {
        modifier(BetCapsuleModifier())
    }
}
