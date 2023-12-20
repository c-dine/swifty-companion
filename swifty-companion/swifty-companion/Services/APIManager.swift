//
//  APIManager.swift
//  swifty-companion
//
//  Created by Celine Dine on 15/12/2023.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    let apiUrl: String = Bundle.main.infoDictionary?["FORTY_TWO_API"] as? String ?? ""
    var accessToken: String = ""
    
    private init() {}
    
    func request<T: Decodable>(
        endpoint: String,
        method: String,
        parameters: [String: Any]?
    )  async throws -> T {
        do {
            guard let url = URL(string: endpoint) else {
                throw NSError(domain: "swifty-companion", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            }
            var request = URLRequest(url: url)
            request.httpMethod = method
            if (self.accessToken.isEmpty) {
                try await self.refreshToken()
            }
            request.setValue("Bearer \(self.accessToken)", forHTTPHeaderField: "Authorization")
        
            let (data, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 401 {
                try await self.refreshToken()
                return try await self.request(endpoint: endpoint, method: method, parameters: parameters) as T
            } else {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(T.self, from: data)
                print(decodedResponse)
                return decodedResponse
            }
        } catch {
            print(error)
            throw NSError(domain: "swifty-companion", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed API call"])
        }
    }
        
    private func refreshToken() async throws {
        guard let url = URL(string: "\(self.apiUrl)/oauth/token") else {
            throw NSError(domain: "swifty-companion", code: -1, userInfo: [NSLocalizedDescriptionKey: "Bad URL"])
        }
        
        let uid: String = Bundle.main.infoDictionary?["FORTY_TWO_UID"] as? String ?? ""
        let secret: String = Bundle.main.infoDictionary?["FORTY_TWO_SECRET"] as? String ?? ""
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = "grant_type=client_credentials&client_id=\(uid)&client_secret=\(secret)".data(using: .utf8)

        do {
            let (data, _) = try await URLSession.shared.data(for: request)

            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            if let accessToken = json?["access_token"] as? String {
                self.accessToken = accessToken
            }
        } catch {
            throw NSError(domain: "swifty-companion", code: -1, userInfo: [NSLocalizedDescriptionKey: "Authentication error"])
        }
    }
}
