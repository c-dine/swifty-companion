//
//  UserDetails.swift
//  swifty-companion
//
//  Created by Celine Dine on 16/12/2023.
//

import SwiftUI

struct UserDetailsView: View {
    
    @ObservedObject var userDetailsViewModel: UserDetailsViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    UserDetailsView(userDetailsViewModel: UserDetailsViewModel())
}
