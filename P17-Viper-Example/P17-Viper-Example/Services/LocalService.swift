//
//  LocalService.swift
//  P17-Viper-Example
//
//  Created by Yuriy Gudimov on 04.02.25.
//

import Foundation

final class LocalService {
    static let shared = LocalService()
    
    func saveDummyData() {
        let dataKey = "DummyDatas"
        var dummyData: [BaseModel] = []
        for number in 1...10 {
            dummyData.append(BaseModel(title: "DummyTitle\(number)", description: "DummyDescription\(number)"))
        }
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(dataKey)
            
            do {
                if let encodedData = try? JSONEncoder().encode(dummyData) {
                    try encodedData.write(to: fileURL)
                }
            } catch {
                fatalError("An error was taken on data saving: \(error)")
            }
        }
    }
    
    func readDummyData() -> [BaseModel]? {
        let dataKey = "DummyDatas"
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(dataKey)
            
            do {
                let stringContent = try String(contentsOf: fileURL, encoding: .utf8)
                
                if let decodedData = try? JSONDecoder().decode([BaseModel].self, from: stringContent.data(using: .utf8) ?? Data()) {
                    return decodedData
                }
            } catch {
                fatalError("An error was taken on data reading: \(error)")
            }
        }
        return []
    }
}
