//
//  Device.swift
//  UIHostingTest
//
//  Created by Alex Stratu on 17.02.2021.
//

import Foundation

struct Device: Identifiable {
    let id: Int
    let icon: String
    let name: String
    let releaseTimeInterval: Double
    
    var released: String {
        let date = Date(timeIntervalSince1970: releaseTimeInterval)
        let formatter = RelativeDateTimeFormatter()
        formatter.dateTimeStyle = .named
        formatter.unitsStyle = .full
        let string = formatter.localizedString(for: date, relativeTo: Date())
        return "Released " + string
    }
    
    static var example: Device {
        devices.first!
    }
    
    static var devices: [Device] {
        [
            Device(
                id: 1,
                icon: "appletv.fill",
                name: "Apple TV",
                releaseTimeInterval: 1168333200
            ),
            Device(
                id: 2,
                icon: "homepod.fill",
                name: "HomePod",
                releaseTimeInterval:  1518166802
            ),
            Device(
                id: 3,
                icon: "desktopcomputer",
                name: "iMac",
                releaseTimeInterval: 903168004
            )
        ]
    }
}
