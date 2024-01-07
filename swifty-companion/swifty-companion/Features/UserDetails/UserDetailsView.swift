//
//  UserDetails.swift
//  swifty-companion
//
//  Created by Celine Dine on 16/12/2023.
//

import SwiftUI

struct UserDetailsView: View {
    
    @ObservedObject var userDetailsViewModel: UserDetailsViewModel

    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = .black.withAlphaComponent(0.2)
    }

    var body: some View {
        
        ZStack {
            
            AsyncImage(url: URL(string: userDetailsViewModel.getCoalition().cover_url)) { phase in
                switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(
                                width: UIScreen.main.bounds.width,
                                height: UIScreen.main.bounds.height
                            )
                            .edgesIgnoringSafeArea(.all)
                    default:
                        EmptyView()
                }
            }
            
            VStack {
                ScrollView {
                    VStack (alignment: .trailing) {
                        UserDetailsCardView(coalition: userDetailsViewModel.getCoalition(), currentUser: userDetailsViewModel.getUser())
                        
                        ProgressBarView(
                            percentage: getPercentageFromLevel(level: userDetailsViewModel.getCursus().level),
                            barColor: Color(hex: userDetailsViewModel.getCoalition().color),
                            backgroundColor: .black.opacity(0.6),
                            contentText: "Level \(Int(userDetailsViewModel.getCursus().level)) - \(Int(getPercentageFromLevel(level: userDetailsViewModel.getCursus().level)))%"
                        )
                    }
                }
                
                TabView {
                    ProjectsListView(projects: userDetailsViewModel.getProjects())
                        .tag(0)
                    SkillsListView(cursus: userDetailsViewModel.getCursus())
                        .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .onAppear {
                  setupAppearance()
                }
            }
            
        }
        
    }

}

#Preview {
    UserDetailsView(userDetailsViewModel: UserDetailsViewModel())
}
