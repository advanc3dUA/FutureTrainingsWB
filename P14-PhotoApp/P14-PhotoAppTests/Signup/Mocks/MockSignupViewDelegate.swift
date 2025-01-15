//
//  MockSignupViewDelegate.swift
//  P14-PhotoAppTests
//
//  Created by Yuriy Gudimov on 15.01.25.
//

import Foundation
import XCTest
@testable import P14_PhotoApp

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    var expectation: XCTestExpectation?
    var successfullSignupCounter: Int = 0
    var errorHandlerCounter: Int = 0
    var signupError: SignupError?
    
    func successfullSignup() {
        successfullSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: P14_PhotoApp.SignupError) {
        signupError = error
        errorHandlerCounter += 1
        expectation?.fulfill()
    }
    
}
