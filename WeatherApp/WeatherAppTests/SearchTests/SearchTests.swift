//import CoreLocation
//import XCTest
//@testable import WeatherApp
//
//class SearchTests: XCTestCase {
//    private var searchViewModelMock: SearchViewModelMock!
//    
//    override func setUp()  {
//        super.setUp()
//    }
//    
//    override func tearDown() {
//        super.tearDown()
//    }
//    
//    func testWeatherInfoValidLocationPlace() {
//        let locationPlace = "Surat"
//        let locationManager = LocationManagerMock()
//        let locationService = LocationServiceMock(locationManager: locationManager)
//        searchViewModelMock = SearchViewModelMock(coreLocationServiceMock: locationService)
//        
//        var weatherDataResponse: WeatherDataResponse?
//        searchViewModelMock.getWeatherInfo(locationPlace: locationPlace) { response in
//            weatherDataResponse = response
//        }
//        
//        XCTAssertNotNil(weatherDataResponse, "weatherDataResponse should not be nil")
//    }
//    
//    func testWeatherInfoInvalidLocationPlace() {
//        let locationPlace = "      "
//        let locationManager = LocationManagerMock()
//        let locationService = LocationServiceMock(locationManager: locationManager)
//        searchViewModelMock = SearchViewModelMock(coreLocationServiceMock: locationService)
//        
//        var weatherDataResponse: WeatherDataResponse?
//        searchViewModelMock.getWeatherInfo(locationPlace: locationPlace) { response in
//            weatherDataResponse = response
//        }
//        
//        XCTAssertNil(weatherDataResponse, "weatherDataResponse be nil")
//    }
//}
