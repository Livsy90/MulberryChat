//
//  File.swift
//  
//
//  Created by Livsy on 18.11.2023.
//

import SwiftUI

struct ActivityIndicator: View {

    @Environment(\.chatTheme) var theme
    var size: CGFloat = 50
    var showBackground = true

    var body: some View {
        ZStack {
            if showBackground {
                Color.black.opacity(0.8)
                    .frame(width: 100, height: 100)
                    .cornerRadius(8)
            }

            ProgressView()
                .foregroundColor(theme.colors.sendButtonBackground)
                .frame(width: size, height: size)
        }
    }
}
