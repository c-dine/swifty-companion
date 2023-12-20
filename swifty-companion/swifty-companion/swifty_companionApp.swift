//
//  swifty_companionApp.swift
//  swifty-companion
//
//  Created by Celine Dine on 14/12/2023.
//

import SwiftUI

@main
struct swifty_companionApp: App {
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView(homeViewModel: homeViewModel)
        }
    }
}
