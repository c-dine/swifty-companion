//
//  UsersService.swift
//  swifty-companion
//
//  Created by Celine Dine on 15/12/2023.
//

import Foundation

class UsersService {
    static let shared = UsersService()
    
    private var currentUser: User? = nil
    private var coalition: Coalition? = nil
    
    let apiUrl: String = Bundle.main.infoDictionary?["FORTY_TWO_API"] as? String ?? ""

    init() {}
    
    func initAll(login: String) async throws {
        do {
            let _ = try await self.fetchUserFromApi(login: login)
            let _ = try await self.fetchUserCoalitionFromApi()
        } catch {
            throw error
        }
    }
    
    // GETTERS
    
    func getCurrentUser() -> User? {
        return self.currentUser
    }
    
    func getCoalition() -> Coalition? {
        return self.coalition
    }
    
    func getCursus() -> CursusUser {
        return self.currentUser!.cursus_users.first(where: { $0.end_at == nil })!
    }
    
    func getProjects() -> [ProjectUser] {
        return self.currentUser!.projects_users.filter { $0.cursus_ids.contains(self.getCursus().cursus.id)
        }
    }
    
    // FETCH FROM API
    
    func fetchUserFromApi(login: String) async throws -> User {
        let endpoint =  "\(self.apiUrl)/users/\(login)"
        let result: User = try await APIManager.shared.request(endpoint: endpoint, method: "GET", parameters: nil)
        self.currentUser = result
        return result
    }
    
    func fetchUserCoalitionFromApi() async throws -> Coalition {
        let endpoint =  "\(self.apiUrl)/users/\(currentUser?.id ?? -1)/coalitions/"
        let result: [Coalition] = try await APIManager.shared.request(endpoint: endpoint, method: "GET", parameters: nil)
        if (result.isEmpty) {
            throw CustomError.runtimeError("No coalitions found.")
        }
        self.coalition = result.count == 2 ? result[1] : result[0]
        return self.coalition!
    }
}
