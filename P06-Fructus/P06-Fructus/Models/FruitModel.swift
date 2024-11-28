//
//  FruitModel.swift
//  P06-Fructus
//
//  Created by Yuriy Gudimov on 28.11.24.
//

import SwiftUI

struct Fruit: Identifiable {
    let id: UUID
    let title: String
    let headline: String
    let image: String
    let gradientColors: [Color]
    let description: String
    let nutrition: [String]
    
    init(title: String, headline: String, image: String, gradientColors: [Color], description: String, nutrition: [String]) {
        self.id = UUID()
        self.title = title
        self.headline = headline
        self.image = image
        self.gradientColors = gradientColors
        self.description = description
        self.nutrition = nutrition
    }
}
