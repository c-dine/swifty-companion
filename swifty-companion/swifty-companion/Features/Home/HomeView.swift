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
    @State private var openErrorSnackbar = false
    @State private var isLoading = false
    
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
                .padding()
                
                if !isLoading {
                    Button("Look up") {
                        Task.init() {
                            isLoading.toggle()
                            let userExists = await homeViewModel.userExists(login: inputText)
                            if (!inputText.isEmpty && userExists) {
                                openErrorSnackbar = false
                                openUserDetails.toggle()
                            } else if (!inputText.isEmpty) {
                                openErrorSnackbar.toggle()
                            }
                            isLoading.toggle()
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 30)
                    .navigationDestination(isPresented: $openUserDetails) {
                        UserDetailsView(userDetailsViewModel: userDetailsViewModel)
                    }
                }
                                
                if isLoading {
                    ProgressView()
                        .padding()
                }
                
                Spacer()
            }
        }
        .overlay(alignment: .bottom) {
            if (openErrorSnackbar) {
                ErrorSnackBarView(message: "Login doesn't exist", actionText: "Close") {
                    openErrorSnackbar.toggle()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView(homeViewModel: HomeViewModel())
}
