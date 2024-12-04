//
//  BrandItemView.swift
//  P08-Touchdown
//
//  Created by Yuriy Gudimov on 04.12.24.
//

import SwiftUI

struct BrandItemView: View {
    let brand: Brand
    var body: some View {
        Image(brand.image)
            .resizable()
            .scaledToFit()
            .padding()
            .background(
                ZStack {
                    Color.white.cornerRadius(12)
                    RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1)
                        .foregroundStyle(.gray)
                }
            )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    BrandItemView(brand: brands[0])
        .padding()
        .background(colorBackground)
}
