//
//  HomeRouter.swift
//  P17-Viper-Example
//
//  Created by Yuriy Gudimov on 04.02.25.
//

import UIKit

protocol HomeRouterInterface: AnyObject {
    
}

final class HomeRouter: HomeRouterInterface {
    static func createModule(using navigationController: UINavigationController) -> HomeViewController {
        let router = HomeRouter()
        guard let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "homeVC") as? HomeViewController else {
            return HomeViewController()
        }
        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        return view
    }
}
