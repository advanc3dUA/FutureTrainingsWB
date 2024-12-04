//
//  RatingsSizesDetailView.swift
//  P08-Touchdown
//
//  Created by Yuriy Gudimov on 04.12.24.
//

import SwiftUI

struct RatingsSizesDetailView: View {
    let sizes: [String] = ["XS", "S", "M", "L", "XL"]
    
    var body: some View {
        HStack(alignment: .top, spacing: 30) {
            VStack(alignment: .leading, spacing: 3, content: {
                Text("Ratings")
                    .font (.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor (colorGray)
                HStack(alignment: .center, spacing: 3, content: {
                    ForEach (1...5, id: \.self) { item in
                        Button (action: {
                            
                        }, label: {
                            Image(systemName: "star.fill")
                                .frame(width: 28, height: 28, alignment: .center)
                                .background (colorGray.cornerRadius(5))
                                .foregroundColor(.white)
                        })
                    }
                })
            })
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 3) {
                Text("Sizes")
                    .font (.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(colorGray)
                
                HStack(alignment: .center, spacing: 5) {
                    ForEach(sizes, id: \.self) { size in
                        Text(size)
                            .font (.footnote)
                            .fontWeight(.heavy)
                            .foregroundStyle(colorGray)
                            .frame(width: 28, height: 28, alignment: .center)
                            .background(
                                ZStack {
                                    Color.white.cornerRadius(5)
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(lineWidth: 2)
                                        .foregroundStyle(.gray)
                                }
                            )
                    }
                }
            }
        }// :HSTACK
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    RatingsSizesDetailView()
        .padding()
}
