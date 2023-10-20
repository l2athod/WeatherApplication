import CoreLocation
import XCTest
@testable import WeatherApp

class HomeTests: XCTestCase {
    private var homeViewModelMock: HomeViewModelMock!
    
    override func setUp()  {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testUserLocationPermissionGranted() {
        let locationManager = LocationManagerMock()
        locationManager.simulateLocationPermissionGranted = true
        let weatherServiceMock = WeatherServiceMock()
        let locationServiceMock = LocationServiceMock(locationManager: locationManager)
        homeViewModelMock = HomeViewModelMock(coreLocationServiceMock: locationServiceMock, weatherServiceMock: weatherServiceMock)
        
        var weatherDataResponse: WeatherDataResponse?
        var location: CLLocation?
        homeViewModelMock.getCurrentWeather { responseData, locationData in
            location = locationData
            weatherDataResponse = responseData
        }
        
        XCTAssertNotNil(location, "Unable to fetch location")
        XCTAssertNotNil(weatherDataResponse, "Unable to fetch weatherDataResponse")
    }    
    
    func testUserLocationPermissionDenied() {
        let locationManager = LocationManagerMock()
        locationManager.simulateLocationPermissionGranted = false
        let weatherServiceMock = WeatherServiceMock()
        let locationServiceMock = LocationServiceMock(locationManager: locationManager)
        homeViewModelMock = HomeViewModelMock(coreLocationServiceMock: locationServiceMock, weatherServiceMock: weatherServiceMock)
        
        var weatherDataResponse: WeatherDataResponse?
        var location: CLLocation?
        homeViewModelMock.getCurrentWeather { responseData, locationData in
            location = locationData
            weatherDataResponse = responseData
        }
        
        XCTAssertNil(location, "location should be nil")
        XCTAssertNil(weatherDataResponse, "weatherDataResponse should be nil")
    }
    
    func testWeatherForecastValidLocation() {
        let location = CLLocation(latitude: 37.7749, longitude: -122.4194)
        let locationManager = LocationManagerMock()
        let weatherServiceMock = WeatherServiceMock()
        let locationServiceMock = LocationServiceMock(locationManager: locationManager)
        homeViewModelMock = HomeViewModelMock(coreLocationServiceMock: locationServiceMock, weatherServiceMock: weatherServiceMock)
        
        var weatherForecasrResponse: WeatherForecastResponse?
        homeViewModelMock.getWeatherForecast(location: location) { responseData in
            weatherForecasrResponse = responseData
        }
        
        XCTAssertNotNil(weatherForecasrResponse, "weatherForecasrResponse should not be nil")
    }
    
    func testWeatherForecastInalidLocation() {
        let location = CLLocation(latitude: 99.325, longitude: -12.124)
        let locationManager = LocationManagerMock()
        let weatherServiceMock = WeatherServiceMock()
        let locationServiceMock = LocationServiceMock(locationManager: locationManager)
        homeViewModelMock = HomeViewModelMock(coreLocationServiceMock: locationServiceMock, weatherServiceMock: weatherServiceMock)
        
        var weatherForecasrResponse: WeatherForecastResponse?
        homeViewModelMock.getWeatherForecast(location: location) { responseData in
            weatherForecasrResponse = responseData
        }
        
        XCTAssertNil(weatherForecasrResponse, "weatherForecasrResponse should be nil")
    }
}
