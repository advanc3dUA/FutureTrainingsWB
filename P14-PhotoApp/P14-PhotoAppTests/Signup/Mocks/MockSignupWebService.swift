//
//  MockSignupWebService.swift
//  P14-PhotoAppTests
//
//  Created by Yuriy Gudimov on 15.01.25.
//

import Foundation
@testable import P14_PhotoApp

class MockSignupWebService: SignUpWebServiceProtocol {
    var isSignupMethodCalled: Bool
    var shouldReturnError: Bool
    
    init() {
        self.isSignupMethodCalled = false
        self.shouldReturnError = false
    }
    
    func signup(withForm formModel: P14_PhotoApp.SignFormRequestModel, completion: @escaping (P14_PhotoApp.SignupResponseModel?, P14_PhotoApp.SignupError?) -> Void) {
        isSignupMethodCalled = true
        
        if shouldReturnError {
            completion(nil, SignupError.failedRequest(description: "Signup request was not successful"))
        } else {
            let signupResponseModel = SignupResponseModel(status: "Ok")
            completion(signupResponseModel, nil)
        }
    }
    
    
}
