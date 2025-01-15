//
//  SignUpWebServiceProtocol.swift
//  P14-PhotoApp
//
//  Created by Yuriy Gudimov on 15.01.25.
//

import Foundation

protocol SignUpWebServiceProtocol {
    func signup(withForm formModel: SignFormRequestModel, completion: @escaping (SignupResponseModel?, SignupError?) -> Void)
}
