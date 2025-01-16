//
//  SignupPresenterProtocol.swift
//  P14-PhotoApp
//
//  Created by Yuriy Gudimov on 16.01.25.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    init(formModelValidator: SignupModelValdiatorProtocol, webService: SignUpWebServiceProtocol, delegate: SignupViewDelegateProtocol)
    
    func proccessUserSignup(formModel: SignupFormModel)
}
