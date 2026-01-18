//
//  MockKeychainService.swift
//  P1Tests
//
//  Created by reveantivirus on 18/01/26.
//

import Foundation


class MockKeychainService: SecureStorage {
    
    var storage: [String: String] = [:]
    
    func save(_ value: String, for key: String) {
        storage[key] = value
    }
    
    func read(key: String) -> String? {
        storage[key]
    }
    
    func delete(key: String) {
        storage.removeValue(forKey: key)
    }
}
