import XCTest
@testable import WeatherApp

final class WeatherAppTests: XCTestCase {
    override func setUp()  {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocationPermissionGranted() {
        let locationManager = LocationManagerMock()
        locationManager.simulateLocationPermissionGranted = true
        let locationService = LocationServiceMock(locationManager: locationManager)
        
        locationManager.startUpdatingLocation()
        let location = locationService.location
        XCTAssertNotNil(location)
    }
    func testLocationPermissionDenied() {
        let locationManager = LocationManagerMock()
        locationManager.simulateLocationPermissionGranted = false
        let locationService = LocationServiceMock(locationManager: locationManager)
        
        locationManager.startUpdatingLocation()
        let error = locationService.error

        XCTAssertNotNil(error)
    }
}
