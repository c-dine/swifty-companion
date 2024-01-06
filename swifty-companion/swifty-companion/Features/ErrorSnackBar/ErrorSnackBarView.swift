//
//  ErrorSnackBarView.swift
//  swifty-companion
//
//  Created by Celine Dine on 20/12/2023.
//

import SwiftUI

struct ErrorSnackBarView: View {
    let message: String
    let actionText: String?
    let action: () -> Void

    var body: some View {
        HStack {
            Text(message)
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
            Spacer()
            if (actionText != nil) {
                Button(action: action) {
                    Text(actionText!)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                }
            }
        }
        .background(Color.red)
        .cornerRadius(8)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}

#Preview {
    ErrorSnackBarView(message:"Error", actionText: "Close") {}
}
