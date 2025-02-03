//
//  CardModel.swift
//  P16-DC-App1
//
//  Created by Yuriy Gudimov on 03.02.25.
//

import SwiftUI

struct Card: Identifiable {
    let id: UUID = UUID()
    let title: String
    let text: String
    let image: Image
}

let cards = [
    Card(title: "3D House", text: "modern architecture, an isometric tiny house, cute illustration, minimalist, vector art, sunset view --q 2 --v 5.1", image: Image(.image1)),
    Card(title: "Sunset", text: "modern architecture, an isometric tiny house, cute illustration, minimalist, vector art, sunset view --q 2 --v 5.1", image: Image(.image2)),
    Card(title: "Sunrise", text: "modern architecture, an isometric tiny house, cute illustration, minimalist, vector art, sunset view --q 2 --v 5.1", image: Image(.image3)),
    Card(title: "Blue Hour", text: "modern architecture, an isometric tiny house, cute illustration, minimalist, vector art, sunset view --q 2 --v 5.1", image: Image(.image4)),
    Card(title: "Night", text: "modern architecture, an isometric tiny house, cute illustration, minimalist, vector art, sunset view --q 2 --v 5.1", image: Image(.image5)),
    Card(title: "Morning", text: "modern architecture, an isometric tiny house, cute illustration, minimalist, vector art, sunset view --q 2 --v 5.1", image: Image(.image6)),
    Card(title: "Day", text: "modern architecture, an isometric tiny house, cute illustration, minimalist, vector art, sunset view --q 2 --v 5.1", image: Image(.image7))
]
