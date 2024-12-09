//
//  RipeningView.swift
//  P11-Avocados
//
//  Created by Yuriy Gudimov on 09.12.24.
//

import SwiftUI

struct RipeningView: View {
    let ripening: Ripening
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            Image(ripening.image)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .clipShape(Circle())
                .background(
                    ZStack {
                        Circle()
                            .fill(.colorAppearenceAdaptive)
                            .frame(width: 120, height: 120, alignment: .center)
                        
                        Circle()
                            .fill(.colorGreenLight)
                            .frame(width: 110, height: 110, alignment: .center)
                    }
                )
                .zIndex(1)
                .offset(y: isAnimating ? 55 : -55)
            
            VStack(alignment: .center, spacing: 10) {
                // STAGE
                VStack(alignment: .center, spacing: 0) {
                    Text(ripening.stage)
                        .font(.system(.largeTitle, design: .serif, weight: .bold))
                    Text("STAGE")
                        .font(.system(.body, design: .serif, weight: .heavy))
                }
                .foregroundStyle(.colorGreenMedium)
                .padding(.top, 65)
                .frame(width: 180)
                // TITLE
                Text(ripening.title)
                    .font(.system(.title, design: .serif, weight: .bold))
                    .foregroundStyle(.colorGreenMedium)
                    .padding(.vertical, 12)
                    .frame(width: 220)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(LinearGradient(colors: [.white, .colorGreenLight], startPoint: .top, endPoint: .bottom))
                            .shadow(color: .colorBlackTransparentLight, radius: 6, x: 0, y: 6)
                    )
                // DESCRIPTION
                Spacer()
                Text(ripening.description)
                    .foregroundStyle(.colorGreenDark)
                    .fontWeight(.bold)
                    .lineLimit(nil)
                Spacer()
                // RIPENESS
                Text(ripening.ripeness.uppercased())
                    .foregroundStyle(.white)
                    .font(.system(.callout, design: .serif, weight: .bold))
                    .shadow(radius: 3)
                    .padding(.vertical)
                    .frame(width: 185)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(LinearGradient(colors: [.colorGreenMedium, .colorGreenDark], startPoint: .top, endPoint: .bottom))
                            .shadow(color: .colorBlackTransparentLight, radius: 6, x: 0, y: 6)
                    )
                // INSTRUCTION
                Text(ripening.instruction)
                    .font(.footnote)
                    .foregroundStyle(.colorGreenLight)
                    .lineLimit(3)
                    .frame(width: 160)
                Spacer()
            }
            .zIndex(0)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            .frame(width: 260, height: 485, alignment: .center)
            .background(
                LinearGradient(colors: [.colorGreenLight, .colorGreenMedium], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(20)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            withAnimation(.easeInOut(duration: 1)) {
                isAnimating.toggle()
            }
        }
    }
}

#Preview {
    RipeningView(ripening: ripeningData[0])
}
