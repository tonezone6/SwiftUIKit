//
//  DeviceRow.swift
//  SwiftUIKit
//
//  Created by Alex Stratu on 19.02.2021.
//

import SwiftUI

struct LocationRow: View {
    let location: Location
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "flag.fill")
                    .resizable()
                    .frame(width: 12, height: 12)
                    .foregroundColor(Color.gray.opacity(0.5))
                
                Text(location.name)
            }
            
            HStack {
                Image(systemName: "location")
                    .resizable()
                    .frame(width: 12, height: 12)
                    .foregroundColor(.red)
                
                VStack(alignment: .leading) {
                    Text("Latitude: " + location.lat)
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    Text("Longitude: " + location.lon)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding([.top, .bottom], 4)
    }
}

struct DeviceRow_Previews: PreviewProvider {
    static var previews: some View {
        LocationRow(location: .example)
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Light")
        
        LocationRow(location: .example)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color(.systemBackground))
            .environment(\.colorScheme, .dark)
            .previewDisplayName("Dark")
    }
}
