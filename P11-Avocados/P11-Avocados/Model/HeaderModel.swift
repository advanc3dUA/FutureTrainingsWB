//
//  HeaderModel.swift
//  P11-Avocados
//
//  Created by Yuriy Gudimov on 09.12.24.
//

import Foundation

struct Header: Identifiable {
    let id: UUID = UUID()
    let image: String
    let headline: String
    let subheadline: String
}
