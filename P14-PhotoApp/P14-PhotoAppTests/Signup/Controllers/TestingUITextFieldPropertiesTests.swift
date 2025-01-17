//
//  TestingUITextFieldPropertiesTests.swift
//  P14-PhotoAppTests
//
//  Created by Yuriy Gudimov on 17.01.25.
//

import XCTest
@testable import P14_PhotoApp

final class TestingUITextFieldPropertiesTests: XCTestCase {
    var sut: SignupViewController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testEmailTextField_WhenCreated_HasEmailAddressContentTypeSet() throws {
        // Arrange
        let emailTextField = try XCTUnwrap(sut.emailTextField, "Email address TextField is not connected")
        // Act
        
        // Assert
        XCTAssertEqual(emailTextField.textContentType, UITextContentType.emailAddress, "Email address TextField doesn't have email content type set")
        }
    
    func testEmailTextField_WhenCreated_HasEmailKeyboardTypeSet() throws {
        let emailTextField = try XCTUnwrap(sut.emailTextField, "Email address TextField is not connected")
        
        XCTAssertEqual(emailTextField.keyboardType, UIKeyboardType.emailAddress, "Email address TextField has different from email type keyboard set")
    }
    
    func testPasswordTextField_WhenCreated_HasPasswordContentTypeSet() throws {
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "Password TextField is not connected")
        
        XCTAssertTrue(passwordTextField.isSecureTextEntry)
    }
    
}
