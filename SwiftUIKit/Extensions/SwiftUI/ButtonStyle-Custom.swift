//
//  Button.swift
//  UIHostingTest
//
//  Created by Alex Stratu on 17.02.2021.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        let foreground = configuration.isPressed ?
            Color.white.opacity(0.5) : .white
        
        // Button tapped, no gradient (orange -> orange).
        let colors: [Color] = [
            configuration.isPressed ? .orange : .red,
            .orange
        ]
        return configuration.label
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(foreground)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: colors),
                    startPoint: .leading, endPoint: .trailing
                ))
            .cornerRadius(8)
    }
}
