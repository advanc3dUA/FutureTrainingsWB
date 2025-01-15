//
//  SignupFormModelValidatorTests.swift
//  P14-PhotoAppTests
//
//  Created by Yuriy Gudimov on 19.12.24.
//

import XCTest
@testable import P14_PhotoApp

final class SignupFormModelValidatorTests: XCTestCase {
    var sut: SignupFormModelValidator!

    override func setUp() async throws {
        sut = SignupFormModelValidator()
    }
    
    override func tearDown() async throws {
        sut = nil
    }
    
    //MARK: - FirstName
    
    func testSignupFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        // Arrange
        // Act
        let result = sut.isFirstNameValid(firstName: "Yuriy")
        
        // Assert
        XCTAssertTrue(result, "The isFirstNameValid() should have return true for a valid first name but returned false")
    }

    func testSignupFormModelValidator_WhenInvalidFirstNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let result = sut.isFirstNameValid(firstName: "")
        
        // Assert
        XCTAssertFalse(result, "The isFirstNameValid() should have return false for an invalid first name but returned true")
    }
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let result = sut.isFirstNameValid(firstName: "Y")
        
        // Assert
        XCTAssertFalse(result, "The isFirstNameValid() should have return false for a too short first name of \(SignupConstants.firstNameMinimumLength) but returned true")
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let result = sut.isFirstNameValid(firstName: "YuriyYuriyYuriy")
        
        // Assert
        XCTAssertFalse(result, "The isFirstNameValid() should have return false for a too long of \(SignupConstants.firstNameMaximumLength) first name but returned true")
    }
    
    //MARK: - LastName
    
    func testSignupFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        // Act
        let result = sut.isLastNameValid(lastName: "Petrov")
        
        // Assert
        XCTAssertTrue(result, "The isLastNameValid() should have return true for a valid last name but returned false")
    }
    
    func testSignupFormModelValidator_WhenInvalidLastNameProvided_ShouldReturnFalse() {
        // Act
        let result = sut.isLastNameValid(lastName: "")
        
        // Assert
        XCTAssertFalse(result, "The isLastNameValid() should have return false for an invalid last name but returned true")
    }
    
    func testSignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        // Act
        let result = sut.isLastNameValid(lastName: "Y")
        
        // Assert
        XCTAssertFalse(result, "The isLastNameValid() should have return false for a too short last name of \(SignupConstants.lastNameMinimumLength) but returned true")
    }
    
    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        // Act
        let result = sut.isLastNameValid(lastName: "PetrovPetrovPetrov")
        
        // Assert
        XCTAssertFalse(result, "The isLastNameValid() should have return false for a too long of \(SignupConstants.lastNameMaximumLength) last name but returned true")
    }
    
    //MARK: - Email
    
    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        let result = sut.isEmailValid(email: "yuriy@gmail.com")
        
        XCTAssertTrue(result, "The isEmailValid() should have return true for a valid email but returned false")
    }
    
    func testSignupFormModelValidator_WhenEmailDoesntContainAtSymbol_ShouldReturnFalse() {
        let result = sut.isEmailValid(email: "yuriygmail.com")
        
        XCTAssertFalse(result, "The isEmailValid() should have return false for an email without an @ symbol but returned true")
    }
    
    func testSignupFormModelValidator_WhebEmailDoesntContainsDotSymbol_ShouldReturnFalse() {
        let result = sut.isEmailValid(email: "yuriy@gmailcom")
        
        XCTAssertFalse(result, "The isEmailValid() should have return false for an email without a dot but returned true")
    }
    
    //MARK: - Password
    
    func testSignupFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
        let result = sut.isPasswordValid(password: "12345678")
        
        XCTAssertTrue(result, "The isPasswordValid() should have return true for a valid password but returned false")
    }
    
    func testSignUpFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        let result = sut.isPasswordValid(password: "12345")
        
        XCTAssertFalse(result, "The isPasswordValid() should have return false for a too short password of \(SignupConstants.passwordMinimumLength) but returned true")
    }
    
    func testSignUpFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        let result = sut.isPasswordValid(password: "1234567890123456789")
        
        XCTAssertFalse(result, "The isPasswordValid() should have return false for a too long password of \(SignupConstants.passwordMaximumLength) but ")
    }
    
    //MARK: - Passwords
    
    func testSignupFormModelValidator_BothPasswordsMatch_ShouldReturnTrue() {
        let result = sut.doPasswordsMatch(password: "12345678", repeatPassword: "12345678")
        
        XCTAssertTrue(result, "doPasswordMatch() should have return true but returned false")
    }
    
    func testSignupFormModelValidator_BothPasswordsDontMatch_ShouldReturnFalse() {
        let result = sut.doPasswordsMatch(password: "12345678", repeatPassword: "1234567")
        
        XCTAssertFalse(result, "doPasswordMatch() should have return false but returned true")
    }
}
