//
//  CustomCircleView.swift
//  P02-Hike
//
//  Created by Yuriy Gudimov on 25.11.24.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            Color.customIndigoMedium,
                            Color.customSalmonLight
                        ],
                        startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                        endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing
                    )
                )
                .onAppear {
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimateGradient.toggle()
                    }
                }
            MotionAnimationView()
        }
        .frame(width: 256, height: 256)
    }
}

#Preview {
    CustomCircleView()
}
