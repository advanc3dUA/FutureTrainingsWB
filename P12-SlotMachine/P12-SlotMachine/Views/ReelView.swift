//
//  ReelView.swift
//  P12-SlotMachine
//
//  Created by Yuriy Gudimov on 10.12.24.
//

import SwiftUI

struct ReelView: View {
    var body: some View {
        Image("gfx-reel")
            .resizable()
            .imageModifier()
    }
}

#Preview(traits: .fixedLayout(width: 220, height: 220)) {
    ReelView()
}
