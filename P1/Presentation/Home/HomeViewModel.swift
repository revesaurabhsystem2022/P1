//
//  HomeViewModel.swift
//  P1
//
//  Created by reveantivirus on 17/01/26.
//

import Foundation


final class HomeViewModel {
    
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    
    var welcomeText: String {
        "Welcome - \(user)"
    }
}
