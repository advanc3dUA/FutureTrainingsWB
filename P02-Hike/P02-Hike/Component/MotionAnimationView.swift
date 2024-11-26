//
//  MotionAnimationView.swift
//  P02-Hike
//
//  Created by Yuriy Gudimov on 25.11.24.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle = Int.random(in: 6...12)
    @State private var isAnimating = false
    
    private func randomCoordinate() -> CGFloat {
        CGFloat.random(in: 0...256)
    }
    
    private func randomSize() -> CGFloat {
        CGFloat.random(in: 4...80)
    }
    
    private func randomScale() -> CGFloat {
        CGFloat.random(in: 0.1...2)
    }
    
    private func randomSpeed() -> Double {
        Double.random(in: 0.05...1.0)
    }
    
    private func randomDelay() -> Double {
        Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundStyle(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(x: randomCoordinate(), y: randomCoordinate())
            }
            .scaleEffect(isAnimating ? randomScale() : 1)
            .onAppear {
                withAnimation(
                    .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                    .repeatForever()
                    .speed(randomSpeed())
                    .delay(randomDelay())
                ) {
                    isAnimating = true
                }
            }
        } //: ZSTACK
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    MotionAnimationView()
        .background(
            Circle()
                .fill(.teal)
        )
}
