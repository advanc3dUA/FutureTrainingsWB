//
//  SignFormRequestModel.swift
//  P14-PhotoApp
//
//  Created by Yuriy Gudimov on 19.12.24.
//

import Foundation

struct SignFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
