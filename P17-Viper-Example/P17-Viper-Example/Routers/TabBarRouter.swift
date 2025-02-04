//
//  TabBarRouter.swift
//  P17-Viper-Example
//
//  Created by Yuriy Gudimov on 04.02.25.
//

import UIKit

protocol TabBarRouterInterface: AnyObject { }

final class TabBarRouter {
    
    static func createModule(using navigationController: UINavigationController) -> TabBarController {
        let router = TabBarRouter()
        let view = TabBarController()
        let presenter = TabBarPresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
}

// MARK: - Interface Setup
extension TabBarRouter: TabBarRouterInterface { }
