//
//  SkillsListView.swift
//  swifty-companion
//
//  Created by Celine Dine on 21/12/2023.
//

import SwiftUI

struct SkillsListView: View {
    
    let cursus: CursusUser
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Skills")
                    .font(.title2)
                    .padding(.bottom, 10)
                ForEach(cursus.skills, id: \.id) { skill in
                    HStack {
                        Text(skill.name)
                            .foregroundStyle(Color(hex: "#00babc"))
                            .bold()
                        Spacer()
                        Text("\(String(format: "%.2f", skill.level))")
                            .bold()
                    }
                }
            }
            .padding()
        }
        .background(.white.opacity(0.95))
    }
}
