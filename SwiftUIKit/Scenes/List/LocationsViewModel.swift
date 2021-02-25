//
//  DevicesViewModel.swift
//  UIHostingTest
//
//  Created by Alex Stratu on 17.02.2021.
//

import Combine
import Foundation

class LocationsViewModel: ObservableObject {
    @Published var loading: Bool = true
    @Published var allLocations: [Location] = []
    
    var subscription: AnyCancellable?
        
    init(location: Location) {
        subscription = Location.netherlands
            .publisher
            .append(location)
            .collect()
            .delay(for: .seconds(1), scheduler: RunLoop.main)
            .sink(receiveValue: { [weak self] locations in
                self?.loading = false
                self?.allLocations = locations
            })
    }
}
