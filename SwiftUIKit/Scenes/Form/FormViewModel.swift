
import Combine
import CoreLocation

class FormViewModel: ObservableObject {
    // Input.
    @Published var name: String = ""
    @Published var lat: String = ""
    @Published var lon: String = ""
    
    // Output.
    @Published var nameValid: Bool = false
    @Published var coordinateValid: Bool = false
    @Published var showButton: Bool = false
    @Published var location: Location = .empty
    
    var subscriptions: [AnyCancellable] = []
        
    init() {
        $name.map { $0.count > 3 }
            .weakAssign(to: \.nameValid, on: self)
            .store(in: &subscriptions)
        
        $lat.combineLatest($lon)
            .map(coordinate(lat:lon:))
            .replaceNil(with: .invalidLocation)
            .map(CLLocationCoordinate2DIsValid)
            .weakAssign(to: \.coordinateValid, on: self)
            .store(in: &subscriptions)
        
        $nameValid.combineLatest($coordinateValid)
            .map { $0 && $1 }
            .weakAssign(to: \.showButton, on: self)
            .store(in: &subscriptions)
        
        $name.combineLatest($lat, $lon)
            .map(Location.init)
            .weakAssign(to: \.location, on: self)
            .store(in: &subscriptions)
    }
    
    func coordinate(lat: String, lon: String) -> CLLocationCoordinate2D? {
        guard let latitude = Double(lat),
              let longitude = Double(lon)
        else { return nil }
        
        return CLLocationCoordinate2D(
            latitude: latitude, longitude: longitude)
    }
}

extension CLLocationCoordinate2D {
    
    static var invalidLocation: CLLocationCoordinate2D {
        .init(latitude: .infinity, longitude: .infinity)
    }
}
