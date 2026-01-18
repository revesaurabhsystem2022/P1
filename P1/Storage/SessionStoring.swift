//
//  SessionStoring.swift
//  P1
//
//  Created by reveantivirus on 18/01/26.
//

import Foundation

protocol SessionStoring {
    func setLogggedIn(_ value: Bool)
    func isLoggedIn() -> Bool
}


