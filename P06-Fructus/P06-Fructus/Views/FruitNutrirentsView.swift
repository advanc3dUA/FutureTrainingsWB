//
//  FruitNutrirentsView.swift
//  P06-Fructus
//
//  Created by Yuriy Gudimov on 29.11.24.
//

import SwiftUI

struct FruitNutrirentsView: View {
    //MARK: - PROPERTIES
    let fruit: Fruit
    let nutrirents: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
    
    //MARK: - BODY
    var body: some View {
        GroupBox {
            DisclosureGroup {
                ForEach(0..<nutrirents.count, id:\.self) { index in
                    Divider()
                        .padding(.vertical, 2)
                    
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrirents[index])
                        }
                        .foregroundStyle(fruit.gradientColors[1])
                        .font(.system(.body, weight: .bold))
                        
                        Spacer(minLength: 25)
                        
                        Text(fruit.nutrition[index])
                            .multilineTextAlignment(.trailing)
                    }
                }
            } label: {
                Text("Nutritional value per 100g")
            }
        }//: GROUPBOX
    }
}

//MARK: - PREVIEW
#Preview(traits: .fixedLayout(width: 375, height: 480)) {
    FruitNutrirentsView(fruit: fruitsData[0])
        .padding()
}
