//
//  Extensions.swift
//  P16-DC-App1
//
//  Created by Yuriy Gudimov on 03.02.25.
//

import SwiftUI

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
