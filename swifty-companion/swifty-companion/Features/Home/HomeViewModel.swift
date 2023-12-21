//
//  HomeController.swift
//  swifty-companion
//
//  Created by Celine Dine on 15/12/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
        
    func userExists(login: String) async -> Bool {
        do {
            let _ = try await UsersService.shared.initAll(login: login.lowercased())
            return true
        } catch {
            print(error)
            return false
        }
    }
    
}
