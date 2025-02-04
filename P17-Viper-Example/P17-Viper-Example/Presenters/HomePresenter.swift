//
//  HomePresenter.swift
//  P17-Viper-Example
//
//  Created by Yuriy Gudimov on 04.02.25.
//

import Foundation

protocol HomePresenterInterface: AnyObject {
    func notifyViewDidLoad()
    func getDataByIndex(_ index: Int) -> BaseModel?
    func fetchDatas()
    var getItemCount: Int { get }
    var getSectionCount: Int { get }
    
}

final class HomePresenter {
    private weak var view: HomeViewInterface?
    private var router: HomeRouterInterface?
    private var interactor: HomeInteractorInterface?
    private var datas: [BaseModel]?
    
    init(view: HomeViewInterface?, router: HomeRouterInterface?, interactor: HomeInteractorInterface?) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension HomePresenter: HomePresenterInterface {
    func notifyViewDidLoad() {
        view?.setupView()
        view?.setTitle(with: "Home")
        fetchDatas()
    }
    
    func getDataByIndex(_ index: Int) -> BaseModel? {
        datas?[index]
    }
    
    func fetchDatas() {
        datas = interactor?.datas
    }
    
    var getItemCount: Int {
        datas?.count ?? 0
    }
    
    var getSectionCount: Int {
        1
    }
}
