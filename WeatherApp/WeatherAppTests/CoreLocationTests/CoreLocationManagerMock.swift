import Foundation
import CoreLocation

protocol LocationManager {
    func startUpdatingLocation()
    var delegate: LocationManagerDelegate? { get set }
    var simulateLocationPermissionGranted: Bool { get set }
}

protocol LocationManagerDelegate {
    func locationUpdated(location: CLLocation)
    func locationError(error: Error)
}

class LocationManagerMock: LocationManager {
    var delegate: LocationManagerDelegate?
    var simulateLocationPermissionGranted: Bool = true
    
    func startUpdatingLocation() {
        if simulateLocationPermissionGranted {
            let location = CLLocation(latitude: 37.7749, longitude: -122.4194)
            delegate?.locationUpdated(location: location)
        } else {
            let error = NSError(domain: "WeatherApp", code: 1, userInfo: nil)
            delegate?.locationError(error: error)
        }
    }
}
