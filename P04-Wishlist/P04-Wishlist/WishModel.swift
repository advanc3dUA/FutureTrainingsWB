//
//  WishModel.swift
//  P03-Wishlist
//
//  Created by Yuriy Gudimov on 27.11.24.
//

import Foundation
import SwiftData

@Model class Wish {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
