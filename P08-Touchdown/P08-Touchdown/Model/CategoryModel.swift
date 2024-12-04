//
//  CategoryModel.swift
//  P08-Touchdown
//
//  Created by Yuriy Gudimov on 04.12.24.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
}
