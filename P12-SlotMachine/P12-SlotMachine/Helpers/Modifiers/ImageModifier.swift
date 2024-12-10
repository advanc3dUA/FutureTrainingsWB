//
//  ImageModifier.swift
//  P12-SlotMachine
//
//  Created by Yuriy Gudimov on 10.12.24.
//

import SwiftUI

struct ImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(minWidth: 140, idealWidth: 200, maxWidth: 220, minHeight: 140, idealHeight: 180, maxHeight: 200, alignment: .center)
            .modifier(ShadowModifier())
    }
}

extension View {
    func imageModifier() -> some View {
        modifier(ImageModifier())
    }
}
