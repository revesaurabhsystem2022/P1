//
//  MockSessionStore.swift
//  P1Tests
//
//  Created by reveantivirus on 18/01/26.
//

import Foundation


final class MockSessionStore: SessionStoring {
    
    private(set) var loggedIn = false
    
    func setLogggedIn(_ value: Bool) {
        loggedIn = value
    }
    
    func isLoggedIn() -> Bool {
        loggedIn
    }
}
