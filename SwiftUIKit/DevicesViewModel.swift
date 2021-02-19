//
//  DevicesViewModel.swift
//  UIHostingTest
//
//  Created by Alex Stratu on 17.02.2021.
//

import Combine
import Foundation

enum State {
    case progress
    case finished([Device])
    case failed(Error)
}

class DevicesViewModel: ObservableObject {
    @Published
    private(set) var state = State.progress
    private      var subscription: Cancellable?
    
    init() {
        subscription = Just(Device.devices)
            .delay(for: 1.5, scheduler: RunLoop.main)
            .map { .finished($0) }
            .catch { Just(.failed($0)) }
            .weakAssign(to: \.state, on: self)
    }
}
