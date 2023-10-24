import MapKit
import UIKit

class LocationManager: NSObject, CLLocationManagerDelegate {
    static let shared = LocationManager()
    private override init() {}
    
    private var manager = CLLocationManager()
    private var completion: ((CLLocation?) -> Void)?
    
    func getUserLocation(completion: @escaping (CLLocation?) -> Void) {
        self.completion = completion
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            completion?(nil)
            return
        }
        manager.stopUpdatingLocation()
        completion?(location)
    }
    
    func resolveLocationName(location: CLLocation, completion: @escaping (String) -> Void) {
        let geocoder = CLGeocoder()
        var placeName = ""
        geocoder.reverseGeocodeLocation(location, preferredLocale: .current) { placemark, error in
            guard let place = placemark?.first, error == nil else { return }
            if let locality = place.locality {
                placeName.append(locality)
            }
            completion(placeName)
        }
    }
    
    func getUserLocation(completion: @escaping (String?, CLLocation?) -> Void) {
        let dispatchGroup = DispatchGroup()
        var location: CLLocation?
        dispatchGroup.enter()
        
        getUserLocation { currentLocation in
            location = currentLocation
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            guard let location = location else {
                completion(nil, nil)
                return
            }
            var city: String?
            dispatchGroup.enter()
            LocationManager.shared.resolveLocationName(location: location) { place in
                city = place
                dispatchGroup.leave()
            }
            
            dispatchGroup.notify(queue: .main) {
                completion(city, location)
            }
        }
    }
}
