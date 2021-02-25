
final class PlacesViewModel {
    var service: WikiDeeplinkService?
    var title: String {
        "My places"
    }
    
    func didSelect(_ place: Place) {
        service = WikiDeeplinkService(place: place)
        service?.openWithWikipedia()
    }
}
