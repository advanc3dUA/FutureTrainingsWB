//
//  TabBarController.swift
//  P17-Viper-Example
//
//  Created by Yuriy Gudimov on 04.02.25.
//

import UIKit

protocol TabBarViewInterface: AnyObject {
    func setupView()
}

class TabBarController: UITabBarController {
    private lazy var homeVC: UIViewController = {
        let navigationController = UINavigationController()
        let homeViewController = HomeRouter.createModule(using: navigationController)
        navigationController.viewControllers = [homeViewController]
        navigationController.tabBarItem.title = "Home"
        navigationController.tabBarItem.image = UIImage(systemName: "house.circle")
        return navigationController
    }()
    
    var presenter: TabBarPresenterInterface? {
        didSet {
            presenter?.notifyViewLoaded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TabBarController: TabBarViewInterface {
    func setupView() {
        viewControllers = [homeVC]
    }
}
