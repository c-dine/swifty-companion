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
    private var cursus: UserCursus? = nil
    private var projects: [ProjectEvaluation] = []
    
    let apiUrl: String = Bundle.main.infoDictionary?["FORTY_TWO_API"] as? String ?? ""

    init() {}
    
    func initAll(login: String) async throws {
        do {
            let _ = try await self.fetchUserFromApi(login: login)
            let _ = try await self.fetchProjectsFromApi()
            try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
            let _ = try await self.fetchUserCoalitionFromApi()
            let _ = try await self.fetchCursusInfoFromApi()
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
    
    func getCursus() -> UserCursus? {
        return self.cursus
    }
    
    func getProjects() -> [ProjectEvaluation] {
        return self.projects
    }
    
    // FETCH FROM API
    
    func fetchUserFromApi(login: String) async throws -> User {
        let endpoint =  "\(self.apiUrl)/users?filter[login]=\(login)"
        let result: [User] = try await APIManager.shared.request(endpoint: endpoint, method: "GET", parameters: nil)
        if (result.isEmpty) {
            throw CustomError.runtimeError("No user found.")
        }
        self.currentUser = result[0]
        return result[0]
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
    
    func fetchCursusInfoFromApi() async throws -> UserCursus {
        let endpoint =  "\(self.apiUrl)/users/\(currentUser?.id ?? -1)/cursus_users/"
        let result: [UserCursus] = try await APIManager.shared.request(endpoint: endpoint, method: "GET", parameters: nil)
        if (result.isEmpty) {
            throw CustomError.runtimeError("No cursus found.")
        }
        self.cursus = result[0]
        return result[0]
    }
    
    func fetchProjectsFromApi() async throws -> [ProjectEvaluation] {
        let endpoint =  "\(self.apiUrl)/users/\(currentUser?.id ?? -1)/projects_users/"
        let result: [ProjectEvaluation] = try await APIManager.shared.request(endpoint: endpoint, method: "GET", parameters: nil)
        self.projects = result
        return result
    }
}
