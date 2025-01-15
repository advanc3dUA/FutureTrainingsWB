//
//  SignupWebServiceTests.swift
//  P14-PhotoAppTests
//
//  Created by Yuriy Gudimov on 19.12.24.
//

import XCTest
@testable import P14_PhotoApp

final class SignupWebServiceTests: XCTestCase {
    var session: URLSession!
    var config: URLSessionConfiguration!
    var sut: SignupWebService!
    var signFormRequestModel: SignFormRequestModel!
    
    override func setUp() async throws {
        config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        session = URLSession(configuration: config)
        sut = SignupWebService(urlString: SignupConstants.signupURL, urlSession: session)
        signFormRequestModel = SignFormRequestModel(firstName: "Sergey", lastName: "Petrov", email: "test@test.com", password: "12345678")
    }
    
    override func tearDown() {
        sut = nil
        signFormRequestModel = nil
        config = nil
        session = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }
    
    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnSuccess() {
        // Arrange
        let jsonString = "{\"status\": \"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        let expectation = self.expectation(description: "SignupWebService Response Expectation")
        
        // Act
        sut.signup(withForm: signFormRequestModel) { (signUpResponseModel, error) in
            // Assert
            XCTAssertEqual(signUpResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenReceivedDifferentJsonResponse_ErrorTookPlace() {
        // Arrange
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains different JSON stcructure")
        
        // Act
        sut.signup(withForm: signFormRequestModel) { (signUpResponseModel, error) in
            // Assert
            XCTAssertNil(signUpResponseModel, "The response model for a request containing unknown JSON structure should be nil")
            XCTAssertEqual(error, SignupError.invalidResponseModel, "The error returned should be equal to SignupErrors.responseModelParsingError")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testSignupWebService_WhenEmptyURLStringProvided_ReturnsError() {
        // Arrange
        let expectation = self.expectation(description: "Signup() method expectation for an empty URL string")
        sut = SignupWebService(urlString: "")
        
        // Act
        sut.signup(withForm: signFormRequestModel) { signupResponseModel, error in
            // Assert
            XCTAssertEqual(error, SignupError.invalidRequestURLString, "The error returned should be equal to SignupErrors.invalidRequestURLStringError")
            XCTAssertNil(signupResponseModel, "The response model for an empty URL string should be nil")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 2)
    }
    
    func testSignupWebService_WhenURLRequestFailed_ReturnsErrorMessageDescription() {
        // Arrange
        let expectation = self.expectation(description: "Signup() method expectation for a failed URL request")
        let errorDescription = "The operation couldn’t be completed. (P14_PhotoApp.SignupError error 0.)"
        MockURLProtocol.error = SignupError.failedRequest(description: errorDescription)
        
        // Act
        sut.signup(withForm: signFormRequestModel) { signupResponseModel, error in
            // Assert
            XCTAssertEqual(error, SignupError.failedRequest(description: errorDescription))
            XCTAssertEqual(error?.localizedDescription, errorDescription)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }
}
