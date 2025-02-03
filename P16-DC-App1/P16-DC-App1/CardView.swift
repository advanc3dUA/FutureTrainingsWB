//
//  CardView.swift
//  P16-DC-App1
//
//  Created by Yuriy Gudimov on 03.02.25.
//

import SwiftUI

struct CardView: View {
    let card: Card
    @State private var isTapped = false
    @State private var time = Date.now
    @State private var isActive = false
    @State private var isDownloading = false
    @State private var hasSimpleWave = false
    @State private var hasComplexWave = false
    @State private var hasPattern = false
    @State private var hasNoise = false
    @State private var hasEmboss = false
    @State private var isPixellated = false
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let startDate = Date()
    @State private var number: Float = 0
    let numberTimer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var isIncrementing = true
    
    struct AnimationValues {
        var position: CGPoint = CGPoint(x: 0, y: 0)
        var scale = 1.0
        var opacity = 0.0
    }
    
    var body: some View {
        TimelineView(.animation) { context in
            layout
            .frame(maxWidth: 400)
            .dynamicTypeSize(.xSmall ... .xLarge)
            .padding(.vertical, 10)
            .if(hasSimpleWave, transform: { view in
                view
                    .distortionEffect(ShaderLibrary.simpleWave(.float(startDate.timeIntervalSinceNow)), maxSampleOffset: CGSize(width: 100, height: 100), isEnabled: hasSimpleWave)
            })
            .if(hasComplexWave, transform: { view in
                view
                    .visualEffect { content, proxy in
                        content.distortionEffect(ShaderLibrary.complexWave(
                            .float(startDate.timeIntervalSinceNow),
                            .float2(proxy.size),
                            .float(0.5),
                            .float(8),
                            .float(10)
                        ), maxSampleOffset: CGSize(width: 100, height: 100), isEnabled: hasComplexWave)
                    }
            })
        }
    }
    
    var layout: some View {
        ZStack {
            TimelineView(.animation) { context in
                card.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: isTapped ? 393 : 360, height: isTapped ? 600 : 300)
                    .if(hasPattern, transform: { view in
                        view
                            .colorEffect(ShaderLibrary.circleLoader(.boundingRect, .float(startDate.timeIntervalSinceNow)), isEnabled: hasPattern)
                    })
                    .if(hasNoise, transform: { view in
                        view
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .colorEffect(
                                        ShaderLibrary.noise(
                                            .float(startDate.timeIntervalSinceNow)
                                        ), isEnabled: hasNoise
                                    )
                                    .blendMode(.overlay)
                            )
                    })
                    .if(hasEmboss, transform: { view in
                        view
                            .layerEffect(ShaderLibrary.emboss(.float(number)), maxSampleOffset: .zero, isEnabled: hasEmboss)
                    })
                    .if(isPixellated, transform: { view in
                        view
                            .layerEffect(ShaderLibrary.pixellate(.float(number)), maxSampleOffset: .zero, isEnabled: isPixellated)
                    })
                    .onReceive(numberTimer, perform: { _ in
                        guard isPixellated || hasEmboss else { return }
//                        isIncrementing ? (number += 0.1) : (number -= 0.1)
                        number += isIncrementing ? 0.1 : -0.1
                        if number >= 10 { isIncrementing = false }
                        if number <= 0 { isIncrementing = true }
                    })
                    .clipShape(.rect(cornerRadius: isTapped ? 0 : 20))
                    .modifier(RoundedRectGradientOverlayModifer())
                    .offset(y: isTapped ? -200 : 0)
                    .phaseAnimator([1, 2], trigger: isTapped, content: { content, phase in
                        // in this case we using phase's numbers
                        content.blur(radius: phase == 2 ? 200 : 0)
                    })
                    .onTapGesture {
                        hasNoise.toggle()
                    }
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
                        .opacity(keyFrame.opacity)
                } keyframes: { value in
                    KeyframeTrack(\.position) {
                        SpringKeyframe(CGPoint(x: 100, y: -100), duration: 0.5, spring: .bouncy)
                        CubicKeyframe(CGPoint(x: 400, y: 1000), duration: 0.5)
                    }
                    KeyframeTrack(\.scale) {
                        CubicKeyframe(1.2, duration: 0.5)
                        CubicKeyframe(1.0, duration: 0.5)
                    }
                    KeyframeTrack(\.opacity) {
                        CubicKeyframe(1, duration: 0)
                        
                    }
                }
            
            
            content
                .padding(20)
                .background( hasSimpleWave || hasComplexWave ?
                                AnyView(Color(.secondarySystemBackground)) :
                                AnyView(Color.clear.background(.regularMaterial))
                )
                .modifier(RoundedRectGradientOverlayModifer())
                .clipShape(.rect(cornerRadius: 20))
                .padding(40)
                .background(.blue.opacity(0.001))
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
                .if(hasPattern) { view in
                view.foregroundStyle(
                    ShaderLibrary.angledFill(
                        .float(10),
                        .float(10),
                        .color(.blue)
                    )
                )
            }
                .foregroundStyle(.primary, .white)
                .font(.largeTitle)
                .padding(20)
                .background( hasSimpleWave || hasComplexWave ?
                                AnyView(Color(.secondarySystemBackground)) :
                                AnyView(Color.clear.background(.ultraThinMaterial))
                )
                .modifier(RoundedRectGradientOverlayModifer())
                .clipShape(.rect(cornerRadius: 20))
                .offset(y: isTapped ? 40 : -44)
        }
    }
    
    var content: some View {
        VStack(alignment: .center) {
            Text(card.text)
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
                    Button {
                        hasPattern.toggle()

                    } label: {
                        Image(systemName: "ellipsis")
                            .symbolEffect(.pulse)
                    }
                    .tint(.primary)

                    Divider()
                    Image(systemName: "sparkle.magnifyingglass")
                        .symbolEffect(.scale.up, isActive: isActive)
                        .onTapGesture {
                            hasSimpleWave.toggle()
                        }
                    Divider()
                    Image(systemName: "face.smiling")
                        .symbolEffect(.appear, isActive: isActive)
                        .onTapGesture {
                            hasComplexWave.toggle()
                        }
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
                .onTapGesture {
                    hasEmboss.toggle()
                }
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
                .onTapGesture {
                    isPixellated.toggle()
                }
        }
    }
}

#Preview {
    CardView(card: cards[0])
}
