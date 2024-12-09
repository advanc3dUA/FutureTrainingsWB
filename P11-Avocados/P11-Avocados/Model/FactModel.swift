//
//  FactModel.swift
//  P11-Avocados
//
//  Created by Yuriy Gudimov on 09.12.24.
//

import SwiftUI

struct Fact: Identifiable {
    let id: UUID = UUID()
    let image: String
    let content: String
}
