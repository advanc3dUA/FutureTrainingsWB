//
//  Shop.swift
//  P08-Touchdown
//
//  Created by Yuriy Gudimov on 04.12.24.
//

import Foundation

class Shop: ObservableObject {
    @Published var isShowingProducts: Bool = false
    @Published var selectedProduct: Product? = nil
}
