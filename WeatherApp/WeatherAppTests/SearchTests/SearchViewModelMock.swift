import Foundation
import CoreLocation
@testable import WeatherApp

class SearchViewModelMock: SearchViewModelProtocol {
    let weatherServiceMock: WeatherServiceMock
    
    init(weatherServiceMock: WeatherServiceMock) {
        self.weatherServiceMock = weatherServiceMock
    }
    
    func getWeather(city: String, completion: @escaping (WeatherApp.WeatherDataResponse?) -> Void) {
        guard !city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return completion(nil)
        }
        weatherServiceMock.getWeather(type: WeatherDataResponse.self, city: city) { resultData in
            switch resultData {
                case .success(let success):
                    completion(success)
                case .failure:
                    completion(nil)
            }
        }
    }
}
