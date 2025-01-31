//
//  ContentView.swift
//  P16-DC-App1
//
//  Created by Yuriy Gudimov on 30.01.25.
//

import SwiftUI

struct ContentView: View {
    @State private var isTapped = false
    @State private var time = Date.now
    @State private var isActive = false
    @State private var isDownloading = false
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let startDate = Date()
    
    struct AnimationValues {
        var position: CGPoint = CGPoint(x: 0, y: 0)
        var scale = 1.0
    }
    
    var body: some View {
        TimelineView(.animation) { context in
            ZStack {
                TimelineView(.animation) { context in
                    Image(.image1)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: isTapped ? 393 : 360, height: isTapped ? 600 : 300)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .colorEffect(
                                    ShaderLibrary.noise(
                                        .float(startDate.timeIntervalSinceNow)
                                    )
                                )
                                .blendMode(.softLight)
                        )
                        .layerEffect(ShaderLibrary.emboss(.float(1)), maxSampleOffset: .zero)
                        .layerEffect(ShaderLibrary.pixellate(.float(1)), maxSampleOffset: .zero)
                        .clipShape(.rect(cornerRadius: isTapped ? 0 : 20))
                        .modifier(RoundedRectGradientOverlayModifer())
                        .offset(y: isTapped ? -200 : 0)
                        .phaseAnimator([1, 2], trigger: isTapped, content: { content, phase in
                            // in this case we using phase's numbers
                            content.blur(radius: phase == 2 ? 200 : 0)
                        }
                        )
                }
                
                Circle()
                    .fill(.thinMaterial)
                    .frame(width: 100)
                    .overlay(
                        Circle().stroke(.secondary)
                    )
                    .overlay(
                        Image(systemName: "photo")
                            .font(.largeTitle)
                    )
                    .keyframeAnimator(initialValue: AnimationValues(), trigger: isDownloading) { content, keyFrame in
                        content
                            .offset(x: keyFrame.position.x, y: keyFrame.position.y)
                            .scaleEffect(keyFrame.scale)
                    } keyframes: { value in
                        KeyframeTrack(\.position) {
                            SpringKeyframe(CGPoint(x: 100, y: -100), duration: 0.5, spring: .bouncy)
                            CubicKeyframe(CGPoint(x: 400, y: 1000), duration: 0.5)
                        }
                        KeyframeTrack(\.scale) {
                            CubicKeyframe(1.2, duration: 0.5)
                            CubicKeyframe(1.0, duration: 0.5)
                        }
                    }
                
                
                content
                    .padding(20)
                    .background(.ultraThinMaterial)
                    .modifier(RoundedRectGradientOverlayModifer())
                    .clipShape(.rect(cornerRadius: 20))
                    .padding(40)
                    .offset(y: isTapped ? 220 : 80)
                //            .phaseAnimator([1, 1.1, 1.2]) { content, phase in
                //                content.scaleEffect(phase)
                //            } animation: { phase in
                //                switch phase {
                //                case 1: .bouncy
                //                case 1.1: .snappy
                //                default: .bouncy
                //                }
                //            }
                
                play
                    .frame(width: isTapped ? 220 : 50)
                    .foregroundStyle(
                        ShaderLibrary.angledFill(
                            .float(10),
                            .float(10),
                            .color(.blue)
                        )
                    )
                    .foregroundStyle(.primary, .white)
                    .font(.largeTitle)
                    .padding(20)
                    .background(.ultraThinMaterial)
                    .modifier(RoundedRectGradientOverlayModifer())
                    .clipShape(.rect(cornerRadius: 20))
                    .offset(y: isTapped ? 40 : -44)
            }
            .frame(maxWidth: 400)
            .dynamicTypeSize(.xSmall ... .xLarge)
            .distortionEffect(ShaderLibrary.simpleWave(.float(startDate.timeIntervalSinceNow)), maxSampleOffset: CGSize(width: 100, height: 100), isEnabled: false)
        }
    }
    
    var content: some View {
        VStack(alignment: .center) {
            Text("modern architecture, an isometric tiny house, cute illustration, minimalist, vector art, night view")
                .font(.subheadline)
            HStack(spacing: 8) {
                VStack(alignment: .leading) {
                    Text("Size")
                        .foregroundStyle(.secondary)
                    Text("1024x1024")
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Type")
                        .foregroundStyle(.secondary)
                    Text("Upscale")
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Date")
                        .foregroundStyle(.secondary)
                    Text("Today 5:19")
                }
                .font(.subheadline)
                .fontWeight(.semibold)
            }
            .frame(height: 44)
            
            HStack {
                HStack {
                    Image(systemName: "ellipsis")
                        .symbolEffect(.pulse)
                    Divider()
                    Image(systemName: "sparkle.magnifyingglass")
                        .symbolEffect(.scale.up, isActive: isActive)
                    Divider()
                    Image(systemName: "face.smiling")
                        .symbolEffect(.appear, isActive: isActive)
                }
                .padding()
                .frame(height: 44)
                .modifier(UnevenRoundedRectGradientOverlayModifer())
                .offset(x: -20, y: 20)
                
                Spacer()
                
                Image(systemName: "square.and.arrow.down")
                    .padding()
                    .frame(height: 44)
                    .modifier(UnevenInvertedRoundedRectOverlayModifier())
                    .offset(x: 20, y: 20)
                    .symbolEffect(.bounce, value: isDownloading)
                    .onTapGesture {
                        isDownloading.toggle()
                    }
            }
            
        }
    }
    
    var play: some View {
        HStack(spacing: 30) {
            Image(systemName: "wand.and.rays")
                .frame(width: 44)
                .symbolEffect(.variableColor.iterative.reversing)
                .symbolEffect(.bounce, value: isTapped)
                .opacity(isTapped ? 1 : 0)
                .blur(radius: isTapped ? 0 : 20)
            Image(systemName: isTapped ? "pause.fill" : "play.fill")
                .frame(width: 44)
                .contentTransition(.symbolEffect(.replace))
                .onTapGesture {
                    withAnimation(.spring()) {
                        isTapped.toggle()
                    }
                }
            Image(systemName: "bell.and.waves.left.and.right.fill")
                .frame(width: 44)
                .symbolEffect(.bounce, options: .speed(3).repeat(3), value: isTapped)
                .opacity(isTapped ? 1 : 0)
                .blur(radius: isTapped ? 0 : 20)
                .onReceive(timer) { value in
                    time = value
                    isActive.toggle()
                }
        }
    }
}

#Preview {
    ContentView()
}
