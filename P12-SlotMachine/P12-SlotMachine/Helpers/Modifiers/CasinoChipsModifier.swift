//
//  CasinoChipsModifier.swift
//  P12-SlotMachine
//
//  Created by Yuriy Gudimov on 10.12.24.
//

import SwiftUI

struct CasinoChipsModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(height: 64)
            .shadowModifier()
    }
}

extension View {
    func casinoChipsModifier() -> some View {
        modifier(CasinoChipsModifier())
    }
}
