//
//  ProjectsListView.swift
//  swifty-companion
//
//  Created by Celine Dine on 21/12/2023.
//

import SwiftUI

struct ProjectsListView: View {
    
    let projects: [ProjectEvaluation]
    
    var body: some View {
        ScrollView {
            VStack {
                
                Text("Projects")
                    .font(.title2)
                    .padding(.bottom, 10)
                
                ForEach(projects, id: \.id) { project in
                    HStack {
                        Text(project.project?.name ?? "Unknown")
                            .foregroundStyle(Color(hex: "#00babc"))
                            .bold()
                        Spacer()
                        if (project.final_mark == nil) {
                            Image(systemName: "clock")
                                .foregroundStyle(.red)
                        } else if project.final_mark! > 50 {
                            HStack {
                                Image(systemName: "checkmark")
                                Text("\(project.final_mark!)")
                                    .bold()
                            }
                            .foregroundStyle(.green)
                        } else {
                            HStack {
                                Image(systemName: "xmark")
                                Text("\(project.final_mark!)")
                                    .bold()
                            }
                            .foregroundStyle(.red)
                        }
                    }
                }
                
            }
            .padding()
        }
        .background(.white.opacity(0.95))
    }
}
