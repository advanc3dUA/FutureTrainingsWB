//
//  FactsView.swift
//  P11-Avocados
//
//  Created by Yuriy Gudimov on 09.12.24.
//

import SwiftUI

struct FactsView: View {
    let fact: Fact
    
    var body: some View {
        ZStack {
            Text(fact.content)
                .padding(.leading, 55)
                .padding(.trailing, 10)
                .padding(.vertical, 3)
                .frame(width: 300, height: 135, alignment: .center)
                .background(
                    LinearGradient(colors: [.colorGreenMedium, .colorGreenLight], startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(12)
                .lineLimit(6)
                .multilineTextAlignment(.leading)
                .font(.footnote)
                .foregroundStyle(.white)
            
            Image(fact.image)
                .resizable()
                .frame(width: 66, height: 66, alignment: .center)
                .clipShape(Circle())
                .background(
                    ZStack {
                        Circle()
                            .foregroundStyle(.colorGreenAdaptive)
                            .frame(width: 90, height: 90, alignment: .center)
                        
                        Circle()
                            .foregroundStyle(
                                LinearGradient(colors: [.colorGreenMedium, .colorGreenLight], startPoint: .trailing, endPoint: .leading)
                            )
                            .frame(width: 82, height: 82, alignment: .center)
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 74, height: 74, alignment: .center)
                    }
                )
                .offset(x: -150)
        }
    }
}

#Preview {
    FactsView(fact: factsData[0])
}
