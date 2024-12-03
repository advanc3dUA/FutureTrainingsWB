//
//  MotionAnimationView.swift
//  P07-Afrika
//
//  Created by Yuriy Gudimov on 03.12.24.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    private func randomCoordinate(max: CGFloat) -> CGFloat {
        CGFloat.random(in: 0...max)
    }
    
    private func randomSize() -> CGFloat {
        CGFloat.random(in: 10...300)
    }
    
    private func randomScale() -> CGFloat {
        CGFloat.random(in: 0.1...2.0)
    }
    
    private func randomSpeed() -> Double {
        Double.random(in: 0.025...1.0)
    }
    
    private func randomDelay() -> Double {
        Double.random(in: 0...2)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle,id:\.self) { item in
                    Circle()
                        .foregroundStyle(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(x: randomCoordinate(max: geometry.size.width), y: randomCoordinate(max: geometry.size.height))
                }
                .onAppear {
                    withAnimation(
                        Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                    ) {
                        isAnimating = true
                    }
                }
            }
        } //: ZSTACK
        .drawingGroup()
    } //: GEOMETRY
}

#Preview {
    MotionAnimationView()
}
