//
//  Button.swift
//  UIHostingTest
//
//  Created by Alex Stratu on 17.02.2021.
//

import Combine
import SwiftUI

struct RoundedButton: View {
    
    let title: String
    let tap = PassthroughSubject<Void, Never>()
    
    var body: some View {
        Button(title) { tap.send() }
            .padding(16)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(Color.blue)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .shadow(color: .init(white: 0.8), radius: 16, y: 8)
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(title: "Button")
    }
}
