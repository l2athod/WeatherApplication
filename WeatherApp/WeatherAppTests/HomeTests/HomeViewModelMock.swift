import Foundation
import CoreLocation
@testable import WeatherApp

class HomeViewModelMock: HomeViewModelProtocol {
    let coreLocationServiceMock: LocationService
    let weatherServiceMock: WeatherServiceMock
    
    init(coreLocationServiceMock: LocationService, weatherServiceMock: WeatherServiceMock) {
        self.coreLocationServiceMock = coreLocationServiceMock
        self.weatherServiceMock = weatherServiceMock
    }
    
    func getCurrentWeather(completion: @escaping (WeatherApp.WeatherDataResponse?, CLLocation?) -> Void) {
        coreLocationServiceMock.requestLocation()
        guard let city = coreLocationServiceMock.city, let location = coreLocationServiceMock.location else{
            return completion(nil, nil)
        }
        
        weatherServiceMock.getWeather(type: WeatherDataResponse.self, city: city) { resultData in
            switch resultData {
                case .success(let success):
                    completion(success, location)
                case .failure:
                    completion(nil, nil)
            }
        }
    }
    
    func getWeatherForecast(location: CLLocation, completion: @escaping (WeatherApp.WeatherForecastResponse?) -> Void) {
        guard coreLocationServiceMock.isValidLocation(coordinate: location.coordinate) else {
            completion(nil)
            return
        }
        weatherServiceMock.getWeatherForecast(type: WeatherForecastResponse.self, location: location) { resultData in
            switch resultData {
                case .success(let success):
                    completion(success)
                case .failure:
                    completion(nil)
            }
        }
    }
}
