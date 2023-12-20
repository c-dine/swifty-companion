//
//  HomeController.swift
//  swifty-companion
//
//  Created by Celine Dine on 15/12/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var userService = UsersService()
    
    func userExists(login: String) async -> Bool {
        do {
            let _ = try await userService.fetchUser(login: login)
            return true
        } catch {
            return false
        }
    }
    
}
