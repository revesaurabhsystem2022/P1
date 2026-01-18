//
//  AuthService.swift
//  P1
//
//  Created by reveantivirus on 17/01/26.
//

import Foundation


final class AuthService: AuthServiceProtocol {
    
    func login(email: String, password: String, completion: @escaping (Result<User, any Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
            
            if email == "test@text.com", password == "123456" {
                let user = User(id: 1, name: "Test User", email: email)
                completion(.success(user))
            }
            else {
                completion(.failure(NSError(domain: "LoginError", code: 401, userInfo: [NSLocalizedDescriptionKey: "Invalid credentaials"])))
            }
        }
    }
}
