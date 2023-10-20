import Foundation
import CoreLocation
@testable import WeatherApp

protocol LocationService {
    var location: CLLocation? { get set }
    var city: String? { get set }
    var error: Error? { get set }
    func requestLocation()
    func isValidLocation(coordinate: CLLocationCoordinate2D) -> Bool
}

class LocationServiceMock: LocationService, LocationManagerDelegate {
    private var locationManager: LocationManager
    var location: CLLocation?
    var city: String?
    var error: Error?
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
        self.locationManager.delegate = self
    }
    
    func requestLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func locationUpdated(location: CLLocation, city: String) {
        self.location = location
        self.city = city
    }
    
    func locationError(error: Error) {
        self.error = error
    }
    
    func isValidLocation(coordinate: CLLocationCoordinate2D) -> Bool {
        return coordinate.latitude >= -90 && coordinate.latitude <= 90 && coordinate.longitude >= -180 && coordinate.longitude <= 180
    }
}
