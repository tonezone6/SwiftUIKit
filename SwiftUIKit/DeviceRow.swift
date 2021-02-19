//
//  DeviceRow.swift
//  SwiftUIKit
//
//  Created by Alex Stratu on 19.02.2021.
//

import SwiftUI

struct DeviceRow: View {
    let device: Device
    
    var body: some View {
        HStack {
            Image(systemName: device.icon)
                .resizable()
                .frame(width: 22, height: 22)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.red)
            
            VStack(alignment: .leading) {
                Text(device.name)
                Text(device.released)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct DeviceRow_Previews: PreviewProvider {
    static var previews: some View {
        DeviceRow(device: .example)
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Light")
        
        DeviceRow(device: .example)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color(.systemBackground))
            .environment(\.colorScheme, .dark)
            .previewDisplayName("Dark")
    }
}
