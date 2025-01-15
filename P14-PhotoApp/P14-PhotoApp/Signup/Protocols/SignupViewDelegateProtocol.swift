//
//  SignupViewDelegateProtocol.swift
//  P14-PhotoApp
//
//  Created by Yuriy Gudimov on 15.01.25.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfullSignup()
    func errorHandler(error: SignupError)
}
