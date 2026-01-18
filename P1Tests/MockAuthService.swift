//
//  MockAuthService.swift
//  P1Tests
//
//  Created by reveantivirus on 18/01/26.
//

import Foundation



class MockAuthService: AuthServiceProtocol{
    
    var receivedEmail: String?
    var receivedPassword: String?
    
    var shouldSucceed = true
    
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        
        receivedEmail = email
        receivedPassword = password
        
        if shouldSucceed {
            completion(.success(User(id: 1, name: "Sourabh", email: email)))
        }
        else
        {
            completion(.failure(NSError(domain: "Login", code: 1)))
        }
    }
}



