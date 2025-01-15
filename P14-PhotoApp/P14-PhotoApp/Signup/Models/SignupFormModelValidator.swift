//
//  SignupFormModelValidator.swift
//  P14-PhotoApp
//
//  Created by Yuriy Gudimov on 19.12.24.
//

import Foundation

class SignupFormModelValidator: SignupModelValdiatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool {
        firstName.count < SignupConstants.firstNameMinimumLength || firstName.count > SignupConstants.firstNameMaximumLength ? false : true
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        lastName.count < SignupConstants.lastNameMinimumLength || lastName.count > SignupConstants.lastNameMaximumLength ? false : true
    }
    
    func isEmailValid(email: String) -> Bool {
        var result = true
        
        if email.isEmpty || !email.contains("@") || !email.contains(".") {
            result = false
        }
        
        return result
    }
    
    func isPasswordValid(password: String) -> Bool {
        password.count < SignupConstants.passwordMinimumLength || password.count > SignupConstants.passwordMaximumLength ? false : true
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        password == repeatPassword
    }
}
