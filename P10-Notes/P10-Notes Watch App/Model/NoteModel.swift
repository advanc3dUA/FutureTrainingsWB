//
//  NoteModel.swift
//  P10-Notes Watch App
//
//  Created by Yuriy Gudimov on 06.12.24.
//

import Foundation

struct Note: Codable, Identifiable {
    let id: UUID
    let text: String
}
