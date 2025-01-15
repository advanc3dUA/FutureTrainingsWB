//
//  SignupPresenter.swift
//  P14-PhotoApp
//
//  Created by Yuriy Gudimov on 15.01.25.
//

import Foundation

class SignupPresenter {
    let formModelValidator: SignupModelValdiatorProtocol
    
    init(formModelValidator: SignupModelValdiatorProtocol) {
        self.formModelValidator = formModelValidator
    }
    
    func proccessUserSignup(formModel: SignupFormModel) {
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return
        }
        
        if !formModelValidator.isEmailValid(email: formModel.email) {
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            return
        }
        
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            return
        }
    }
}
