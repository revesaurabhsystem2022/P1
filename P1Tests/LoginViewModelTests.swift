//
//  LoginViewModelTests.swift
//  P1Tests
//
//  Created by reveantivirus on 18/01/26.
//


import XCTest
@testable import P1

final class LoginViewModelTests: XCTestCase {
    
    var viewModel: LoginViewModel!
    var authService: MockAuthService!
    var storage: MockKeychainService!
    
    override func setUp() {
        super.setUp()
        
        authService = MockAuthService()
        storage = MockKeychainService()
        
        viewModel = LoginViewModel(
            authService: authService,
            secureStorage: storage
        )
    }
    
    // ✅ TEST 1: Successful Login
    func test_loginSuccess_callsOnLoginSuccess_andStoresCredentials() {
        
        let expectation = expectation(description: "Login success callback")
        
        viewModel.onLoginSuccess = { user in
            XCTAssertEqual(user.email, "test@test.com")
            expectation.fulfill()
        }
        
        viewModel.login(email: "test@test.com", password: "1234")
        
        waitForExpectations(timeout: 1)
        
        XCTAssertEqual(storage.read(key: KeychainKeys.email), "test@test.com")
        XCTAssertEqual(storage.read(key: KeychainKeys.password), "1234")
    }
    
    // ❌ TEST 2: Login Failure
    func test_loginFailure_callsOnError() {
        
        authService.shouldSucceed = false
        
        let expectation = expectation(description: "Login error callback")
        
        viewModel.onLoginFailure = { message in
            XCTAssertFalse(message.isEmpty)
            expectation.fulfill()
        }
        
        viewModel.login(email: "wrong@test.com", password: "wrong")
        
        waitForExpectations(timeout: 1)
    }
    
    // 🧪 TEST 3: AuthService Receives Correct Inputs
    func test_login_passesCorrectEmailAndPasswordToAuthService() {
        
        viewModel.login(email: "input@test.com", password: "abcd")
        
        XCTAssertEqual(authService.receivedEmail, "input@test.com")
        XCTAssertEqual(authService.receivedPassword, "abcd")
    }
    
}

