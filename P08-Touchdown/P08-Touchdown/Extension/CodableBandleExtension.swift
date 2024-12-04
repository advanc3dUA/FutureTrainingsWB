//
//  CodableBandleExtension.swift
//  P08-Touchdown
//
//  Created by Yuriy Gudimov on 04.12.24.
//

import Foundation

extension Bundle {
    public func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to find \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to get data for \(file)")
        }
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode data from file \(file)")
        }
        
        return decodedData
    }
}
