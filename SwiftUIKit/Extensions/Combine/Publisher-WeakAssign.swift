//
//  Publisher+WeakAssign.swift
//  SwiftUIKit
//
//  Created by Alex Stratu on 19.02.2021.
//

import Combine

extension Publisher where Failure == Never {
    
    func weakAssign<T: AnyObject>(
        to keyPath: ReferenceWritableKeyPath<T, Output>, on object: T) -> AnyCancellable {
        
        sink { [weak object] value in
            object?[keyPath: keyPath] = value
        }
    }
}
