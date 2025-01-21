//
//  SignupError.swift
//  P14-PhotoApp
//
//  Created by Yuriy Gudimov on 19.12.24.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    case invalidFirstName
    case invalidFamilyName
    case invalidEmail
    case invalidPassword
    case passwordsDoesntMatch
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel,
                .invalidRequestURLString,
                .invalidFirstName,
                .invalidFamilyName,
                .invalidEmail,
                .invalidPassword,
                .passwordsDoesntMatch:
            return ""
        }
    }
}
