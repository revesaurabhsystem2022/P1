//
//  AuthServiceProtocol.swift
//  P1
//
//  Created by reveantivirus on 17/01/26.
//

import Foundation



protocol AuthServiceProtocol {
    func login(email: String, password: String, completion: @escaping(Result<User,Error>)-> Void)
}
