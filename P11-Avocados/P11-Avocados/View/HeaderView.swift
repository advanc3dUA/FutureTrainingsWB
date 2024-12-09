//
//  HeaderView.swift
//  P11-Avocados
//
//  Created by Yuriy Gudimov on 09.12.24.
//

import SwiftUI

struct HeaderView: View {
    @State private var showHeadline = false
    var header: Header
    
    var body: some View {
        ZStack {
            Image(header.image)
                .resizable()
                .scaledToFit()
            HStack(alignment: .top, spacing: 0) {
                Rectangle()
                    .fill(.colorGreenLight)
                    .frame(width: 4)
                VStack(alignment: .leading, spacing: 6) {
                    Text(header.headline)
                        .font(.system(.title, design: .serif))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .shadow(radius: 3)
                    
                    Text(header.subheadline)
                        .font(.system(.footnote, design: .serif))
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.white)
                        .shadow(radius: 3)
                }
                .padding(.vertical, 0)
                .padding(.horizontal, 20)
                .frame(width: 281, height: 105)
                .background(.colorBlackTransparentLight)
            }
            .frame(width: 285, height: 105, alignment: .center)
            .offset(x: -66, y: showHeadline ? 75 : 220)
        }
        .frame(width: 480, height: 320, alignment: .center)
        .onAppear {
            withAnimation(.spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.5)) {
                showHeadline = true
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    HeaderView(header: headersData[0])
}
