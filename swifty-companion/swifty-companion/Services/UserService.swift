//
//  UsersService.swift
//  swifty-companion
//
//  Created by Celine Dine on 15/12/2023.
//

import Foundation

class UsersService {
    static let shared = UsersService()
    let apiUrl: String = Bundle.main.infoDictionary?["FORTY_TWO_API"] as? String ?? ""
    var currentUser: User? = nil

    init() {}

    func fetchUser(login: String) async throws -> User {
        let endpoint =  "\(self.apiUrl)/users?filter[login]=\(login)"
        let result: [User] = try await APIManager.shared.request(endpoint: endpoint, method: "GET", parameters: nil)
        self.currentUser = result[0]
        return self.currentUser!
    }
}
