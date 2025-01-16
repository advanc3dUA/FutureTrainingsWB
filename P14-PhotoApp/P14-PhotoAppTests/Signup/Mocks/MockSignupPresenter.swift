//
//  MockSignupPresenter.swift
//  P14-PhotoAppTests
//
//  Created by Yuriy Gudimov on 16.01.25.
//

import Foundation
@testable import P14_PhotoApp

class MockSignupPresenter: SignupPresenterProtocol {
    var proccessUserSignupCalled: Bool = false
    
    required init(formModelValidator: any P14_PhotoApp.SignupModelValdiatorProtocol, webService: any P14_PhotoApp.SignUpWebServiceProtocol, delegate: any P14_PhotoApp.SignupViewDelegateProtocol) {
        
    }
    
    func proccessUserSignup(formModel: P14_PhotoApp.SignupFormModel) {
        proccessUserSignupCalled = true
    }
    
}
