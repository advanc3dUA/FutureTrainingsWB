//
//  PageModel.swift
//  P05-Pinch
//
//  Created by Yuriy Gudimov on 27.11.24.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let title: String
}

extension Page {
    var thumbnailName: String {
        "thumb-" + title
    }
}
