//
//  CenterModifier.swift
//  P07-Afrika
//
//  Created by Yuriy Gudimov on 03.12.24.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
