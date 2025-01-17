//
//  P15_TestingViewControllerNavigationTests.swift
//  P15-TestingViewControllerNavigationTests
//
//  Created by Yuriy Gudimov on 17.01.25.
//

import XCTest
@testable import P15_TestingViewControllerNavigation

final class P15_TestingViewControllerNavigationTests: XCTestCase {
    var sut: ViewController!
    var navigationController: UINavigationController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        sut.loadViewIfNeeded()
        navigationController = .init(rootViewController: sut)
    }

    override func tearDownWithError() throws {
        sut = nil
        navigationController = nil
    }
    
    func testNextViewButton_WhenTapped_PushesSecondViewConyroller() {
        sut.nextViewButton.sendActions(for: .touchUpInside)
        
        guard let _ = navigationController.topViewController as? SecondViewController else {
            XCTFail()
            return
        }
    }
    
    func testNextViewButton_WhenTapped_PushesSecondViewController_V2() {
        let spyNavigationController = SpyNavigationController(rootViewController: sut)
        sut.nextViewButton.sendActions(for: .touchUpInside)
        
        guard let _ = spyNavigationController.pushedViewController as? SecondViewController else {
            XCTFail()
            return
        }
    }
    
}
