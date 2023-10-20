import Foundation
import CoreLocation

protocol IWeatherService {
    func getWeather<T: Decodable>(type: T.Type, city: String, completion: @escaping (Result<T, DataError>) -> Void)
    func getWeatherForecast<T: Decodable>(type: T.Type, location: CLLocation, completion: @escaping (Result<T, DataError>) -> Void)
}

class WeatherService : IWeatherService {
    func getWeather<T: Decodable>(type: T.Type, city: String, completion: @escaping (Result<T, DataError>)  -> Void) {
        APIManager.shared.fetchData(type: type, router: WeatherAPIRouter.getWeather(city: city)) { response in
            switch response {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
    
    func getWeatherForecast<T>(type: T.Type, location: CLLocation, completion: @escaping (Result<T, DataError>)  -> Void) where T : Decodable {
        APIManager.shared.fetchData(type: type, router: WeatherAPIRouter.getWeatherForecast(lat: String(location.coordinate.latitude), long: String(location.coordinate.longitude))) { response in
            switch response {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
