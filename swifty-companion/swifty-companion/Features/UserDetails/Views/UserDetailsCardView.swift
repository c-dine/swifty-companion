//
//  UserDetailsCardView.swift
//  swifty-companion
//
//  Created by Celine Dine on 21/12/2023.
//

import SwiftUI

struct UserDetailsCardView: View {
    
    let coalition: Coalition
    let currentUser: User
    
    var body: some View {
        VStack {
            AvatarView(link: currentUser.image!.link!)
            Text("\(currentUser.first_name!) \(currentUser.last_name!)")
                .bold()
                .font(.title3)
                .padding(.top, 10)
                .foregroundStyle(.white)
            Text("\(currentUser.login!)")
                .foregroundStyle(.gray)
            
            HStack(spacing: 20) {
                VStack(spacing: 20) {
                    Image(systemName: "mappin.and.ellipse")
                    Image(systemName: "envelope.fill")
                    Image(systemName: "australsign")
                    Image(systemName: "figure.pool.swim")
                }
                .foregroundStyle(Color(hex: coalition.color))
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("\(currentUser.location ?? "Unavailable")")
                    Text(currentUser.email ?? "Unknown")
                    Text("\(currentUser.wallet ?? 0)")
                    Text("\(currentUser.pool_month ?? "-") \(currentUser.pool_year ?? "-")")
                }
                .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity)
            .padding(20)
            .background(Color(.black).opacity(0.6))
        }
    }
}
