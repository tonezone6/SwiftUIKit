//
//  UIControl+Combine.swift
//  SwiftUIKit
//
//  Created by Alex Stratu on 17.02.2021.
//

import Combine
import ControlPublisher
import UIKit

extension UIButton {
    
    var tapPublisher: AnyPublisher<Void, Never> {
        publisher(for: .touchUpInside)
            .eraseToAnyPublisher()
    }
}

extension UITextField {
    
    var textPublisher: AnyPublisher<String, Never> {
        publisher(for: .editingChanged)
            .map { self.text }
            .replaceNil(with: "")
            .eraseToAnyPublisher()
    }
}

extension UISwitch {
    
    var isOnPublisher: AnyPublisher<Bool, Never> {
        publisher(for: .valueChanged)
            .map { self.isOn }
            .eraseToAnyPublisher()
    }
}
