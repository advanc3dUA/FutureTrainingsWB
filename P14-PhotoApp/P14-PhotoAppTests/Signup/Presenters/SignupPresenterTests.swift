//
//  SignupPresenterTests.swift
//  P14-PhotoAppTests
//
//  Created by Yuriy Gudimov on 15.01.25.
//

import XCTest
@testable import P14_PhotoApp

final class SignupPresenterTests: XCTestCase {
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebSerice: MockSignupWebService!
    var mockSignupViewDelegate: MockSignupViewDelegate!
    var sut: SignupPresenter!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        signupFormModel = SignupFormModel(firstName: "Yuriy",
                                              lastName: "Ivanov",
                                              email: "hello@hello.de",
                                              password: "12345678",
                                              repeatPassword: "12345678"
        )
        mockSignupModelValidator = MockSignupModelValidator()
        mockSignupWebSerice = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator,
                              webService: mockSignupWebSerice,
                              delegate: mockSignupViewDelegate
        )
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebSerice = nil
        sut = nil
        mockSignupViewDelegate = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Arrange
        
        // Act
        sut.proccessUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValdated, "FirstName was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "LastName was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "Email was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignupModelValidator.isRepeatPasswordValidated, "Passwords doesn't match")
    }

    func testSignupPresenter_WhenGivenValidForModel_ShouldCallSignupMethod() {
        // Arrange
        
        // Act
        sut.proccessUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupWebSerice.isSignupMethodCalled, "The signup() method wasn't called in the SignupWebService class")
    }
    
    func testSignupPresenter_WhenSignupOperationSuccessfull_CallsSuccessOnViewDelegate() {
        // Arrange
        let myExpectation = expectation(description: "Expected successfullSignup() method to be called")
        mockSignupViewDelegate.expectation = myExpectation
        
        // Act
        sut.proccessUserSignup(formModel: signupFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        // Assert
        XCTAssertEqual(mockSignupViewDelegate.successfullSignupCounter, 1, "The successfullSignup() method was called more than once")
    }
    
    func testSignupPresenter_WhenSignupOperationFails_ShouldCallErrorOnDelegate() {
        // Arrange
        let errorHandlerExpecation = expectation(description: "Expected errorSignup() method to be called")
        mockSignupViewDelegate.expectation = errorHandlerExpecation
        mockSignupWebSerice.shouldReturnError = true
        
        // Act
        sut.proccessUserSignup(formModel: signupFormModel)
        self.wait(for: [errorHandlerExpecation], timeout: 5)
        
        // Assert
        XCTAssertEqual(mockSignupViewDelegate.successfullSignupCounter, 0)
        XCTAssertEqual(mockSignupViewDelegate.errorHandlerCounter, 1)
        XCTAssertNotNil(mockSignupViewDelegate.signupError)
    }
}
