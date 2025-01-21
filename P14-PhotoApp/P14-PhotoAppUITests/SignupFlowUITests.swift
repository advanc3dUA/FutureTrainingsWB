//
//  SignupFlowUITests.swift
//  SignupFlowUITests
//
//  Created by Yuriy Gudimov on 21.01.25.
//

import XCTest

final class SignupFlowUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    @MainActor
    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let firstNameTextField = app.textFields["firstNameTextField"]
        let familyNametextField = app.textFields["familyNameTextField"]
        let emailTextField = app.textFields["emailTextField"]
        let passwordTextField = app.secureTextFields["passwordTextField"]
        let repeatPasswordTextField = app.secureTextFields["repeatPasswordTextField"]
        let signupButton = app.buttons["signupButton"]
        
        XCTAssertTrue(firstNameTextField.isEnabled, "First name UITextField is not enabled")
        XCTAssertTrue(familyNametextField.isEnabled, "Family name UITextField is not enabled")
        XCTAssertTrue(emailTextField.isEnabled, "Email UITextField is not enabled")
        XCTAssertTrue(passwordTextField.isEnabled, "Password UITextField is not enabled")
        XCTAssertTrue(repeatPasswordTextField.isEnabled, "Repeat password UITextField is not enabled")
        XCTAssertTrue(signupButton.isEnabled, "Signup UIButton UITextField is not enabled")
    }
    
    func testSignupViewController_WhenInvalidFormSubmitted_PresentsErrorAlertDialog() {
        let app = XCUIApplication()
        app.launch()
        
        let firstNameTextField = app.textFields["firstNameTextField"]
        firstNameTextField.tap()
        firstNameTextField.typeText("Y")
        let familyNametextField = app.textFields["familyNameTextField"]
        familyNametextField.tap()
        familyNametextField.typeText("G")
        let emailTextField = app.textFields["emailTextField"]
        emailTextField.tap()
        emailTextField.typeText("@")
        let passwordTextField = app.secureTextFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("12345678")
        let repeatPasswordTextField = app.secureTextFields["repeatPasswordTextField"]
        repeatPasswordTextField.tap()
        repeatPasswordTextField.typeText("123456")
        let signupButton = app.buttons["signupButton"]
        signupButton.tap()
        
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1), "An error alert wasn't presented")
    }

    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
