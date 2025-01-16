//
//  SignupViewControllerTests.swift
//  P14-PhotoAppTests
//
//  Created by Yuriy Gudimov on 16.01.25.
//

import XCTest
@testable import P14_PhotoApp

final class SignupViewControllerTests: XCTestCase {
    var storyboard: UIStoryboard!
    var sut: SignupViewController!

    override func setUpWithError() throws {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        storyboard = nil
        sut = nil
    }

    func testSignupViewController_WhenCreated_HasRequiredTextfieldsEmpty() throws {
        
        let firstNameTextField = try XCTUnwrap(sut.firstNameTextField, "FirstNameTextField isn't connected to IBOutlet")
        XCTAssertEqual(firstNameTextField.text, "", "First name text field is not empty")
        
        let lastNameTextField = try XCTUnwrap(sut.lastNameTextField, "LastNameTextField appeared to be not connected to IBOutlet")
        XCTAssertEqual(lastNameTextField.text, "", "Last name text field is not empty")
        
        let emailTextField = try XCTUnwrap(sut.emailTextField, "EmailTextField appeared to be not connected to IBOutlet")
        XCTAssertEqual(emailTextField.text, "", "Email text field is not empty")
        
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "PasswordTextField appeared to be not connected to IBOutlet")
        XCTAssertEqual(passwordTextField.text, "", "Password text field is not empty")
        
        let repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField, "RepeatPassword text field appeared to be not connected to IBOutlet")
        XCTAssertEqual(repeatPasswordTextField.text, "", "RepeatPassword text field is not empty")
    }

    func testSignupViewController_WhenCreated_HasSignupButtonAndAction() throws {
        let signupButton: UIButton = try XCTUnwrap(sut.signupButton, "SignupButton is not connected")
        let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "SignupButton does not have expected action")
        XCTAssertEqual(signupButtonActions.count, 1)
        XCTAssertEqual(signupButtonActions.first, "signupButtonAction:", "There is no method signupButtonAction assigned to SignupButton")
    }
    
    func testSignupViewController_WhenSignupButtonTapped_InvokesSignupProccess() {
        // Arrange
        let mockSignupModelValidator = MockSignupModelValidator()
        let signupWebService = MockSignupWebService()
        let mockSignupViewDelegate = MockSignupViewDelegate()
        
        let mockSignupPresenter = MockSignupPresenter(formModelValidator: mockSignupModelValidator, webService: signupWebService, delegate: mockSignupViewDelegate)
        
        sut.signupPresenter = mockSignupPresenter
        
        // Act
        sut.signupButton.sendActions(for: .touchUpInside)
        
        // Assert
        XCTAssertTrue(mockSignupPresenter.proccessUserSignupCalled, "ProccessUserSignup was not called")
    }
}
