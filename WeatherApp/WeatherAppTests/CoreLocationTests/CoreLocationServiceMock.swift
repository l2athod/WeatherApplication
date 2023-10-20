import Foundation
import CoreLocation
@testable import WeatherApp

protocol LocationService {
    var location: CLLocation? { get set }
    var error: Error? { get set }
    func requestLocation()
    func isValidLocation(coordinate: CLLocationCoordinate2D) -> Bool
    func getUserLocation(location: CLLocation, completion: (WeatherApp.WeatherDataResponse?, CLLocation?) -> Void)
    func getWeatherInfo(locationPlace: String, completion: @escaping (WeatherApp.WeatherDataResponse?) -> Void)
}

class LocationServiceMock: LocationService, LocationManagerDelegate {
    private var locationManager: LocationManager
    var location: CLLocation?
    var error: Error?
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
        self.locationManager.delegate = self
    }
    
    func requestLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func locationUpdated(location: CLLocation) {
        self.location = location
    }
    
    func locationError(error: Error) {
        self.error = error
    }
    
    func getUserLocation(location: CLLocation, completion: (WeatherApp.WeatherDataResponse?, CLLocation?) -> Void) {
        completion(weatherDataResponseMock, location)
    }
    
    func getWeatherInfo(locationPlace: String, completion: @escaping (WeatherApp.WeatherDataResponse?) -> Void) {
        completion(weatherDataResponseMock)
    }
    
    func isValidLocation(coordinate: CLLocationCoordinate2D) -> Bool {
        return coordinate.latitude >= -90 && coordinate.latitude <= 90 && coordinate.longitude >= -180 && coordinate.longitude <= 180
    }
}
