//
//  RipeningModel.swift
//  P11-Avocados
//
//  Created by Yuriy Gudimov on 09.12.24.
//

import Foundation

struct Ripening: Identifiable {
    let id: UUID = UUID()
    let image: String
    let stage: String
    let title: String
    let description: String
    let ripeness: String
    let instruction: String
}
