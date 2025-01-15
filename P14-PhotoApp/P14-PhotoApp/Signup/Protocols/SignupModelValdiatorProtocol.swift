//
//  SignupModelValdiatorProtocol.swift
//  P14-PhotoApp
//
//  Created by Yuriy Gudimov on 15.01.25.
//

import Foundation

protocol SignupModelValdiatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool
    
    func isLastNameValid(lastName: String) -> Bool
    
    func isEmailValid(email: String) -> Bool
    
    func isPasswordValid(password: String) -> Bool
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
}
