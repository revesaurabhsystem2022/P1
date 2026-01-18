//
//  SecureStorage.swift
//  P1
//
//  Created by reveantivirus on 18/01/26.
//

import Foundation


protocol SecureStorage {
    func save(_ value: String, for key: String)
    func read(key: String) -> String?
    func delete(key: String)
}
