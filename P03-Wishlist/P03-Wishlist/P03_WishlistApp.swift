//
//  P03_WishlistApp.swift
//  P03-Wishlist
//
//  Created by Yuriy Gudimov on 27.11.24.
//

import SwiftUI
import SwiftData

@main
struct P03_WishlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
        }
    }
}
