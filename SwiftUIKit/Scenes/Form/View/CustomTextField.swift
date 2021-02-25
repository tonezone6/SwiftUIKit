//
//  CustomTextField2.swift
//  SwiftUIKit
//
//  Created by Alex Stratu on 24.02.2021.
//

import SwiftUI

struct CustomTextField: View {
    let title: String
    var secure: Bool = false
    var keyboard: UIKeyboardType = .default
    
    @Binding var text: String
    @Binding var valid: Bool
    
    var body: some View {
        HStack {
            if secure {
                SecureField(title, text: $text)
                    .font(.subheadline)
            } else {
                TextField(title, text: $text)
                    .font(.subheadline)
                    .keyboardType(keyboard)
            }
            
            Spacer()

            if text.isEmpty == false {
                if valid {
                    image(with: .success)
                        .foregroundColor(.green)
                } else {
                    image(with: .warning)
                        .foregroundColor(.orange)
                }
                
                clearButton
            }
        }
        .animation(.linear(duration: 0.1))
    }
}

extension CustomTextField {
    enum Checkmark: String {
        case success = "checkmark.circle"
        case warning = "exclamationmark.circle"
        case clear = "xmark.circle.fill"
    }
    
    func image(with checkmark: Checkmark) -> some View {
        Image(systemName: checkmark.rawValue)
            .resizable()
            .scaledToFit()
            .frame(width: 22, height: 22)
    }
    
    var clearButton: some View {
        Button(
            action: {
                text.removeAll()
            }, label: {
                image(with: .clear)
                    .foregroundColor(.gray)
            })
    }
}

struct ValidationTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(
            title: "Email", secure: false,
            keyboard: .emailAddress,
            text: .constant("asd@"),
            valid: .constant(true)
        )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Light")
        
        CustomTextField(
            title: "Email", secure: false,
            keyboard: .emailAddress,
            text: .constant("asd@"),
            valid: .constant(false)
        )
        .previewLayout(.sizeThatFits)
        .background(Color(.systemBackground))
        .environment(\.colorScheme, .dark)
        .previewDisplayName("Dark")
    }
}

