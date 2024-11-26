//
//  GradientButtonStyle.swift
//  P02-Hike
//
//  Created by Yuriy Gudimov on 25.11.24.
//

import Foundation
import SwiftUI

public struct GradientButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                configuration.isPressed ?
                    LinearGradient(
                        colors: [
                            Color.customGrayMedium,
                            Color.customGrayLight
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                :
                    LinearGradient(
                        colors: [
                            Color.customGrayLight,
                            Color.customGrayMedium
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
            )
            .cornerRadius(40)
    }
}
