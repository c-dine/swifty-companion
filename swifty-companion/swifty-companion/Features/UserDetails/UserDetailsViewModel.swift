//
//  UserDetailsViewModel.swift
//  swifty-companion
//
//  Created by Celine Dine on 20/12/2023.
//

import Foundation


class UserDetailsViewModel: ObservableObject {
    
    @Published var userService = UsersService()
    
}
