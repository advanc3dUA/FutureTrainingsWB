//
//  HomeInteractor.swift
//  P17-Viper-Example
//
//  Created by Yuriy Gudimov on 04.02.25.
//

import Foundation

protocol HomeInteractorInterface: AnyObject {
    var datas: [BaseModel]? { get }
}

final class HomeInteractor: HomeInteractorInterface {
    var datas: [BaseModel]? {
        LocalService.shared.saveDummyData()
        return LocalService.shared.readDummyData()
    }
}
