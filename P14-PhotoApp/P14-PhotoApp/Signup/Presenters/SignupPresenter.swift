//
//  SignupPresenter.swift
//  P14-PhotoApp
//
//  Created by Yuriy Gudimov on 15.01.25.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol {
    private let formModelValidator: SignupModelValdiatorProtocol
    private let webService: SignUpWebServiceProtocol
    private weak var delegate: SignupViewDelegateProtocol?
    
    required init(formModelValidator: SignupModelValdiatorProtocol, webService: SignUpWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webService = webService
        self.delegate = delegate
    }
    
    func proccessUserSignup(formModel: SignupFormModel) {
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            delegate?.errorHandler(error: SignupError.invalidFirstName)
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            delegate?.errorHandler(error: SignupError.invalidFamilyName)
            return
        }
        
        if !formModelValidator.isEmailValid(email: formModel.email) {
            delegate?.errorHandler(error: SignupError.invalidEmail)
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            delegate?.errorHandler(error: SignupError.invalidPassword)
            return
        }
        
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            delegate?.errorHandler(error: SignupError.passwordsDoesntMatch)
            return
        }
        
        let requestModel = SignFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        webService.signup(withForm: requestModel) {[weak self] responseModel, error in
            if let error = error {
                self?.delegate?.errorHandler(error: error)
                return
            }
            if let _ = responseModel {
                self?.delegate?.successfullSignup()
                return
            }
            
        }
    }
}
