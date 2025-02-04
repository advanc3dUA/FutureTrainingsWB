//
//  TabBarPresenter.swift
//  P17-Viper-Example
//
//  Created by Yuriy Gudimov on 04.02.25.
//

import UIKit

protocol TabBarPresenterInterface: AnyObject {
    func notifyViewLoaded()
}

final class TabBarPresenter {
    
    private weak var view: TabBarViewInterface?
    private weak var router: TabBarRouterInterface?
    
    init(view: TabBarViewInterface?, router: TabBarRouterInterface?) {
        self.view = view
        self.router = router
    }
}

// MARK: - Interface Setup
extension TabBarPresenter: TabBarPresenterInterface {
    
    func notifyViewLoaded() {
        view?.setupView()
    }
}
