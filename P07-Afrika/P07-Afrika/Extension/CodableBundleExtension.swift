//
//  CodableBundleExtension.swift
//  P07-Afrika
//
//  Created by Yuriy Gudimov on 02.12.24.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [CoverImage] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to create URL to file: \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to get data from file: \(file)")
        }
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode([CoverImage].self, from: data) else {
            fatalError("Failed to decode data of file: \(file)")
        }
        
        return decodedData
    }
}
