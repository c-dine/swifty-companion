//
//  TokenManager.swift
//  swifty-companion
//
//  Created by Celine Dine on 15/12/2023.
//

import Foundation

class TokenManager {
    static let shared = TokenManager()
    
    var refreshToken: String?
    
    
    private init() {}
    
    func updateTokens(accessToken: String, refreshToken: String) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
    
    func clearTokens() {
        accessToken = nil
        refreshToken = nil
    }
}

struct TokenResponse: Codable {
    let accessToken: String
    let refreshToken: String
}
