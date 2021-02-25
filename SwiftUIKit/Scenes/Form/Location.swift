
import Foundation

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let lat: String
    let lon: String
    
    var coordinate: String {
        "lat: \(lat), lon: \(lon)"
    }
}

extension Location {
    static var example: Location {
        .init(name: "Eindhoven", lat: "51.4381", lon: "5.4752")
    }
    
    static var empty: Location {
        .init(name: "", lat: "", lon: "")
    }
    
    static var netherlands: [Location] {
        [
            Location(name: "Leiden", lat: "52.166666", lon: "4.4833314"),
            Location(name: "Rotterdam", lat: "51.919662988", lon: "4.475331432"),
            Location(name: "Utrecht", lat: "52.091", lon: "5.122"),
            Location(name: "Amsterdam", lat: "52.308498766", lon: "4.938496246"),
            Location(name: "Eindhoven", lat: "51.4381", lon: "5.4752")
        ]
    }
}
