//
//  ContentView.swift
//  swifty-companion
//
//  Created by Celine Dine on 14/12/2023.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var homeViewModel: HomeViewModel
    @State private var inputText = ""
    @State private var openUserDetails = false
    
    @StateObject var userDetailsViewModel = UserDetailsViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image(uiImage: UIImage(named: "42_Logo")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Enter student login...", text: $inputText)
                }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                Button("Look up") {
                    Task.init() {
                        let userExists = await homeViewModel.userExists(login: inputText)
                        if (!inputText.isEmpty && userExists) {
                            openUserDetails = true
                        }
                    }
                }
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 30)
                    .navigationDestination(isPresented: $openUserDetails) {
                        UserDetailsView(userDetailsViewModel: userDetailsViewModel)
                    }
                
                Spacer()
            }
           
        }
        .padding()
    }
}

#Preview {
    HomeView(homeViewModel: HomeViewModel())
}
