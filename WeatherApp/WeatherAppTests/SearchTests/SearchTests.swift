import CoreLocation
import XCTest
@testable import WeatherApp

class SearchTests: XCTestCase {
    private var searchViewModelMock: SearchViewModelMock!
    
    override func setUp()  {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testWeatherInfoValidLocationPlace() {
        let city = "Surat"
        let weatherServiceMock = WeatherServiceMock()
        searchViewModelMock = SearchViewModelMock(weatherServiceMock: weatherServiceMock)
        
        var weatherDataResponse: WeatherDataResponse?
        searchViewModelMock.getWeather(city: city) { responseData in
            weatherDataResponse = responseData
        }
        
        XCTAssertNotNil(weatherDataResponse, "weatherDataResponse should not be nil")
    }
    
    func testWeatherInfoInvalidLocationPlace() {
        let city = "      "
        let weatherServiceMock = WeatherServiceMock()
        searchViewModelMock = SearchViewModelMock(weatherServiceMock: weatherServiceMock)
        
        var weatherDataResponse: WeatherDataResponse?
        searchViewModelMock.getWeather(city: city) { responseData in
            weatherDataResponse = responseData
        }
        
        
        XCTAssertNil(weatherDataResponse, "weatherDataResponse be nil")
    }
}
