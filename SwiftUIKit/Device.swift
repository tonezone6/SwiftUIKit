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
    let timestamp: Double
}

extension Device {
    private var formatter: RelativeDateTimeFormatter {
        let formatter = RelativeDateTimeFormatter()
        formatter.dateTimeStyle = .named
        formatter.unitsStyle = .full
        return formatter
    }
    
    var released: String {
        let date = Date(timeIntervalSince1970: timestamp)
        let string = formatter
            .localizedString(for: date, relativeTo: Date())
        return "Released " + string
    }
}

extension Device {
    static var example: Device { devices.first! }
    static var devices: [Device] {
        [
            Device(id: 1, icon: "appletv.fill", name: "Apple TV", timestamp: 1168333200),
            Device(id: 2, icon: "homepod.fill", name: "HomePod", timestamp: 1518166802),
            Device(id: 3, icon: "desktopcomputer", name: "iMac", timestamp: 903168004)
        ]
    }
}
