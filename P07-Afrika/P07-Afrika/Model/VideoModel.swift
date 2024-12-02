//
//  VideoModel.swift
//  P07-Afrika
//
//  Created by Yuriy Gudimov on 02.12.24.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}
