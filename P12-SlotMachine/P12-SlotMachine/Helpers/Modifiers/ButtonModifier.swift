//
//  ButtonModifier.swift
//  P12-SlotMachine
//
//  Created by Yuriy Gudimov on 10.12.24.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .tint(.white)
    }
}

extension View {
    func buttonModifier() -> some View {
        modifier(ButtonModifier())
    }
}
