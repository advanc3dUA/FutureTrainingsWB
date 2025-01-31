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
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Image(.image1)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: isTapped ? 393 : 360, height: isTapped ? 600 : 300)
                .clipShape(.rect(cornerRadius: isTapped ? 0 : 20))
                .offset(y: isTapped ? -200 : 0)
            
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
                }
                
            }
            .padding(20)
            .background(.ultraThinMaterial)
            .modifier(RoundedRectGradientOverlayModifer())
            .clipShape(.rect(cornerRadius: 20))
            .padding(40)
            .offset(y: isTapped ? 220 : 80)
            
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
            .frame(width: isTapped ? 220 : 50)
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
    }
}

#Preview {
    ContentView()
}
