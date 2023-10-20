import Foundation
import CoreLocation

protocol HomeViewModelProtocol: AnyObject {
    func getCurrentWeather(completion: @escaping (WeatherDataResponse?, CLLocation?) -> Void)
    func getWeatherForecast(location: CLLocation, completion: @escaping (WeatherForecastResponse?) -> Void)
}

class HomeViewModel: HomeViewModelProtocol{
    private var weatherService: IWeatherService
    
    init(weatherService: WeatherService = WeatherService()) {
        self.weatherService = weatherService
    }
    
    func getCurrentWeather(completion: @escaping (WeatherDataResponse?, CLLocation?) -> Void) {
        LocationManager.shared.getUserLocation { [weak self] city, location in
            guard location != nil else {
                completion(nil, nil)
                return
            }
            self?.weatherService.getWeather(type: WeatherDataResponse.self, city: city!) { response in
                switch response {
                    case .success(let response):
                        completion(response, location)
                    case .failure:
                        completion(nil, nil)
                }
            }
        }
    }
    
    func getWeatherForecast(location: CLLocation, completion: @escaping (WeatherForecastResponse?) -> Void) {
        weatherService.getWeatherForecast(type: WeatherForecastResponse.self, location: location) { response in
            switch response {
                case .success(let response):
                    completion(response)
                case .failure:
                    completion(nil)
            }
        }
    }
}
