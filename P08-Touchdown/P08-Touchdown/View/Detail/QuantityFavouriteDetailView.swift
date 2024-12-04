//
//  QuantityFavouriteDetailView.swift
//  P08-Touchdown
//
//  Created by Yuriy Gudimov on 04.12.24.
//

import SwiftUI

struct QuantityFavouriteDetailView: View {
    @State private var counter = 0
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            Button {
                if counter > 0 {
                    counter -= 1
                }
            } label: {
                Image(systemName: "minus.circle")
                
            }
            
            Text("\(counter)")
                .fontWeight(.semibold)
                .frame(width: 36)
            
            Button {
                if counter < 100 {
                    counter += 1
                }
            } label: {
                Image(systemName: "plus.circle")
                
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "heart.circle")
                    .foregroundStyle(.pink)
            }


        }
        .font(.system(.title, design: .rounded))
        .foregroundStyle(.black)
        .imageScale(.large)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    QuantityFavouriteDetailView()
        .padding()
}
