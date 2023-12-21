//
//  ProgressBar.swift
//  swifty-companion
//
//  Created by Celine Dine on 21/12/2023.
//

import SwiftUI

struct ProgressBarView: View {
    let percentage: Double
    let barColor: Color
    let backgroundColor: Color
    let contentText: String
    let height = 35.0

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: geometry.size.width, height: height)
                        .foregroundColor(backgroundColor)

                    Rectangle()
                        .frame(width: geometry.size.width * percentage / 100, height: height)
                        .foregroundColor(barColor)
                }
                
                Text(contentText)
                    .foregroundStyle(.white)
                    .bold()

            }
        }
        .frame(height: height)
    }
}

#Preview {
    ProgressBarView(percentage: 60, barColor: .red, backgroundColor: .black, contentText: "Level 1 - 60%")
}
