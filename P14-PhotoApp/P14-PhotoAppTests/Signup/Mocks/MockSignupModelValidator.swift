//
//  MockSignupModelValidator.swift
//  P14-PhotoAppTests
//
//  Created by Yuriy Gudimov on 15.01.25.
//

import Foundation
@testable import P14_PhotoApp

class MockSignupModelValidator: SignupModelValdiatorProtocol {
    var isFirstNameValdated: Bool = false
    var isLastNameValidated: Bool = false
    var isEmailValidated: Bool = false
    var isPasswordValidated: Bool = false
    var isRepeatPasswordValidated: Bool = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValdated = true
        return isFirstNameValdated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isEmailValid(email: String) -> Bool {
        isEmailValidated = true
        return isEmailValidated
    }
    
    func isPasswordValid(password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        isRepeatPasswordValidated = true
        return isRepeatPasswordValidated
    }
    
}
