//
//  UserDetailsViewModel.swift
//  swifty-companion
//
//  Created by Celine Dine on 20/12/2023.
//

import Foundation


class UserDetailsViewModel: ObservableObject {
        
    func getUser() -> User {
        return UsersService.shared.getCurrentUser()!
    }
    
    func getCoalition() -> Coalition {
        return UsersService.shared.getCoalition()!
    }
    
    func getCursus() -> UserCursus {
        return UsersService.shared.getCursus()!
    }
    
    func getProjects() -> [ProjectEvaluation] {
        return UsersService.shared.getProjects()
    }
    
}
