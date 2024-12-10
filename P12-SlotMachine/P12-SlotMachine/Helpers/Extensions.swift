//
//  Extensions.swift
//  P12-SlotMachine
//
//  Created by Yuriy Gudimov on 10.12.24.
//

import SwiftUI

extension Text {
    func scoreLabelStyle() -> Text {
        self
            .foregroundStyle(.white)
            .font(.system(size: 10, weight: .bold, design: .rounded))
    }
    
    func scoreNumberStyle() -> Text {
        self
            .foregroundStyle(.white)
            .font(.system(.title, design: .rounded, weight: .heavy))
    }
}
