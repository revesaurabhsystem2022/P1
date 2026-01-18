//
//  AuthManager.swift
//  P1
//
//  Created by reveantivirus on 18/01/26.
//

import Foundation



final class AuthManager {
    
    
    static let shared = AuthManager()
    
    private init() {}
    
    func isUserLoggedIn() -> Bool {
        let email = KeychainService.shared.read(key: KeychainKeys.email)
        let password = KeychainService.shared.read(key: KeychainKeys.password)
        return email != nil && password != nil
    }
    
    func getLoggedInUser() -> User? {
        guard let email = KeychainService.shared.read(key: KeychainKeys.email) else {
            return nil
        }
        return User(id: 1, name: "Sourabh", email: email)
    }
    
    func logout() {
        KeychainService.shared.delete(key: KeychainKeys.email)
        KeychainService.shared.delete(key: KeychainKeys.password)
    }
}
