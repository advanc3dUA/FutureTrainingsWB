//
//  RecipeCardView.swift
//  P11-Avocados
//
//  Created by Yuriy Gudimov on 09.12.24.
//

import SwiftUI

struct RecipeCardView: View {
    let recipe: Recipe
    @State private var isShowingSheet = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(recipe.image)
                .resizable()
                .scaledToFit()
                .background(.white)
                .cornerRadius(12)
                .shadow(color: .colorBlackTransparentLight, radius: 8, x: 0, y: 0)
                .overlay(
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "bookmark")
                                .font(Font.title.weight(.light))
                                .foregroundStyle(.white)
                                .imageScale(.small)
                                .shadow(color: .colorBlackTransparentLight, radius: 8, x: 0, y: 0)
                                .padding(.trailing, 20)
                                .padding(.top, 22)
                        }
                        Spacer()
                    }
                )
            
            VStack(alignment: .leading, spacing: 12) {
                // TITLE
                Text(recipe.title)
                    .font(.system(.title, design: .serif, weight: .bold))
                    .foregroundStyle(.colorGreenMedium)
                    .lineLimit(1)
                // HEADLINE
                Text(recipe.headline)
                    .font(.system(.body, design: .serif))
                    .foregroundStyle(.gray)
                    .italic()
                // RATING
                RatingView(recipe: recipe)
                
                // COOKING
                CookingView(recipe: recipe)
                .font(.footnote)
                .foregroundStyle(.gray)
                
            }
            .padding()
            .padding(.bottom, 12)
            .onTapGesture {
                withAnimation {
                    isShowingSheet = true
                }
            }
            .sheet(isPresented: $isShowingSheet) {
                RecipeDetailView(recipe: recipe)
            }
        }
    }
}

#Preview {
    RecipeCardView(recipe: recipesData[0])
}
