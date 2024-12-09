//
//  RecipeModel.swift
//  P11-Avocados
//
//  Created by Yuriy Gudimov on 09.12.24.
//

import SwiftUI

struct Recipe: Identifiable {
    let id: UUID = UUID()
    let title: String
    let headline: String
    let image: String
    let rating: Int
    let serves: Int
    let preparation: Int
    let cooking: Int
    let instructions: [String]
    let ingredients: [String]
}
