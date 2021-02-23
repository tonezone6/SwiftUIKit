//
//  State-Equatable.swift
//  SwiftUIKitTests
//
//  Created by Alex Stratu on 23.02.2021.
//

@testable import SwiftUIKit

extension State: Equatable {
    
    public static func == (lhs: State, rhs: State) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.finished(let l), .finished(let r)):
            return l == r
        case (.failed(let l), .failed(let r)):
            return l.localizedDescription ==
                r.localizedDescription
        default:
            return false
        }
    }
}
