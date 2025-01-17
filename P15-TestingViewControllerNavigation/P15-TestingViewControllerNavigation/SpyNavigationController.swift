//
//  SpyNavigationController.swift
//  P15-TestingViewControllerNavigation
//
//  Created by Yuriy Gudimov on 17.01.25.
//

import UIKit

class SpyNavigationController: UINavigationController {
    var pushedViewController: UIViewController!
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        
        pushedViewController = viewController
    }
}
