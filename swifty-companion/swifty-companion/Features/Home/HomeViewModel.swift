//
//  HomeController.swift
//  swifty-companion
//
//  Created by Celine Dine on 15/12/2023.
//

import Foundation
import Network

class HomeViewModel: ObservableObject {
    
    let monitor = NWPathMonitor()
    @Published private var networkIsGood = true
    
    init() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                DispatchQueue.main.async {
                    self.networkIsGood = true
                }
            } else {
                DispatchQueue.main.async {
                    self.networkIsGood = false
                }
            }
        }
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
    
    func userExists(login: String) async -> Bool {
        do {
            if (login.isEmpty) {
                return false
            }
            let _ = try await UsersService.shared.initAll(login: login.lowercased())
            return true
        } catch {
            print(error)
            return false
        }
    }
    
    func networkWorks() -> Bool {
        return self.networkIsGood
    }
    
}
