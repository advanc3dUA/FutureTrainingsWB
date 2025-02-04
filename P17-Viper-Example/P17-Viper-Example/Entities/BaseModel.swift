//
//  BaseModel.swift
//  P17-Viper-Example
//
//  Created by Yuriy Gudimov on 04.02.25.
//

import Foundation

struct BaseModel: Codable {
    let title: String
    let description: String
    
    static let sample: [BaseModel] = [
        BaseModel(title: "Dummy1", description: "Dummy1"),
        BaseModel(title: "Dummy2", description: "Dummy2"),
        BaseModel(title: "Dummy3", description: "Dummy3"),
        BaseModel(title: "Dummy4", description: "Dummy4"),
    ]
}
