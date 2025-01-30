//
//  ContentView.swift
//  P16-DC-App1
//
//  Created by Yuriy Gudimov on 30.01.25.
//

import SwiftUI

struct ContentView: View {
    @State private var isTapped = false
    
    var body: some View {
        ZStack {
            Image(.image1)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .clipShape(.rect(cornerRadius: 20))
            
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
                            .symbolEffect(.scale.up)
                        Divider()
                        Image(systemName: "face.smiling")
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
            .padding(20)
            .offset(y: 80)
            
            HStack(spacing: 30) {
                Image(systemName: "wand.and.rays")
                    .frame(width: 44)
                    .symbolEffect(.variableColor.iterative.reversing)
                    .symbolEffect(.bounce, value: isTapped)
                Image(systemName: isTapped ? "pause.fill" : "play.fill")
                    .frame(width: 44)
                    .contentTransition(.symbolEffect(.replace))
                    .onTapGesture {
                        isTapped.toggle()
                    }
                Image(systemName: "bell.and.waves.left.and.right.fill")
                    .frame(width: 44)
                    .symbolEffect(.bounce, options: .speed(3).repeat(3), value: isTapped)
            }
            .foregroundStyle(.primary, .white)
            .font(.largeTitle)
            .padding(20)
            .background(.ultraThinMaterial)
            .modifier(RoundedRectGradientOverlayModifer())
            .clipShape(.rect(cornerRadius: 20))
            .offset(y: -44)
        }
        .frame(maxWidth: 400)
        .padding(20)
        .dynamicTypeSize(.xSmall ... .xLarge)
    }
}

#Preview {
    ContentView()
}
