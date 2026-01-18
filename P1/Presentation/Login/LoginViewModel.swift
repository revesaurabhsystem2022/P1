//
//  LoginViewModel.swift
//  P1
//
//  Created by reveantivirus on 17/01/26.
//

import Foundation


final class LoginViewModel {
    private let authService: AuthServiceProtocol
    private let storage : SecureStorage
    
    var onLoginSuccess: ((User) -> Void)?
    var onLoginFailure: ((String) -> Void)?
    
    
    
    
    init(authService: AuthServiceProtocol, secureStorage: SecureStorage) {
        self.authService = authService
        self.storage = secureStorage
    }
    
    func login(email: String, password: String) {
        
        guard !email.isEmpty, !password.isEmpty else {
            onLoginFailure?("Email and password required")
            return
        }
        
        authService.login(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
//                    KeychainService.shared.save(email, for: KeychainKeys.email)
//                    KeychainService.shared.save(password, for: KeychainKeys.password)
                    self?.storage.save(user.email, for: KeychainKeys.email)
                    self?.storage.save(password, for:  KeychainKeys.password)
                    self?.onLoginSuccess?(user)
                case .failure(let error):
                    self?.onLoginFailure?(error.localizedDescription)
                }
            }
        }
    }
}


//For Testing


//final class LoginViewModel {
//    private let authService: AuthServiceProtocol
//    private let storage: SecureStorage
//    private let sessionStore: SessionStoring
//   
//
//    init(authService: AuthServiceProtocol, storage: SecureStorage, sessionStore: SessionStoring) {
//        self.authService = authService
//        self.storage = storage
//        self.sessionStore = sessionStore
//    }
//
//    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
//
//        guard !email.isEmpty, !password.isEmpty else {
//            completion(false)
//            return
//        }
//
//        authService.login(email: email, password: password) { result in
//            switch result {
//            case .success(let user):
//                self.storage.save(user.email, for: "email")
//                self.storage.save(password, for: "password")
//                self.sessionStore.setLogggedIn(true)
//                completion(true)
//            case .failure(let error):
//                completion(false)
//            }
//            
//        }
//    }
//}
