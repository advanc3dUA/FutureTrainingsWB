//
//  SignupFlowUITests.swift
//  SignupFlowUITests
//
//  Created by Yuriy Gudimov on 21.01.25.
//

import XCTest

final class SignupFlowUITests: XCTestCase {
    private var app: XCUIApplication!
    private var firstNameTextField: XCUIElement!
    private var familyNameTextField: XCUIElement!
    private var emailTextField: XCUIElement!
    private var passwordTextField: XCUIElement!
    private var repeatPasswordTextField: XCUIElement!
    private var signupButton: XCUIElement!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()

        firstNameTextField = app.textFields["firstNameTextField"]
        familyNameTextField = app.textFields["familyNameTextField"]
        emailTextField = app.textFields["emailTextField"]
        passwordTextField = app.secureTextFields["passwordTextField"]
        repeatPasswordTextField = app.secureTextFields["repeatPasswordTextField"]
        signupButton = app.buttons["signupButton"]

        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
        firstNameTextField = nil
        familyNameTextField = nil
        emailTextField = nil
        passwordTextField = nil
        repeatPasswordTextField = nil
        signupButton = nil
    }

//    @MainActor
    func testSignupViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        XCTAssertTrue(firstNameTextField.isEnabled, "First name UITextField is not enabled")
        XCTAssertTrue(familyNameTextField.isEnabled, "Family name UITextField is not enabled")
        XCTAssertTrue(emailTextField.isEnabled, "Email UITextField is not enabled")
        XCTAssertTrue(passwordTextField.isEnabled, "Password UITextField is not enabled")
        XCTAssertTrue(repeatPasswordTextField.isEnabled, "Repeat password UITextField is not enabled")
        XCTAssertTrue(signupButton.isEnabled, "Signup UIButton UITextField is not enabled")
    }
    
    func testSignupViewController_WhenInvalidFormSubmitted_PresentsErrorAlertDialog() {
        firstNameTextField.tap()
        firstNameTextField.typeText("Y")
        
        familyNameTextField.tap()
        familyNameTextField.typeText("G")

        emailTextField.tap()
        emailTextField.typeText("@")

        passwordTextField.tap()
        passwordTextField.typeText("12345678")

        repeatPasswordTextField.tap()
        repeatPasswordTextField.typeText("123456")

        signupButton.tap()
        
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1), "An error alert wasn't presented")
    }
    
    func testSignupViewController_WhenValidFormSubmitted_PresentsSuccessAlertDialog() {
        firstNameTextField.tap()
        firstNameTextField.typeText("Yuriy")
        
        familyNameTextField.tap()
        familyNameTextField.typeText("Gudimov")

        emailTextField.tap()
        emailTextField.typeText("yuriygudimov@gmail.com")

        passwordTextField.tap()
        for char in "1234567890" {
            passwordTextField.typeText(String(char))
        }

        repeatPasswordTextField.tap()
        repeatPasswordTextField.typeText("1234567890")

        signupButton.tap()
        
        XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 1), "An success alert wasn't presented")
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
