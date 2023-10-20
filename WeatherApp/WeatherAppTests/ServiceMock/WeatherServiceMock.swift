import Foundation
import CoreLocation
@testable import WeatherApp

class WeatherServiceMock: IWeatherService {
    func getWeather<T>(type: T.Type, city: String, completion: @escaping (Result<T, DataError>) -> Void) where T : Decodable {
        let result = getWeather()
        guard result != nil else {
            completion(.failure(.invalidResponse))
            return
        }
        completion(.success(result as! T))
    }
    
    func getWeatherForecast<T>(type: T.Type, location: CLLocation, completion: @escaping (Result<T, DataError>) -> Void) where T : Decodable {
        let result = getForecast()
        guard result != nil else {
            completion(.failure(.invalidResponse))
            return
        }
        completion(.success(result as! T))
    }
    
    private func getWeather() -> WeatherDataResponse? {
        do {
            let weatherDataResponseMock = try JSONDecoder().decode(WeatherDataResponse.self, from: weatherDataResponseData!)
            return weatherDataResponseMock
        } catch {
            return nil
        }
    }
    
    private func getForecast() -> WeatherForecastResponse? {
        do {
            let weatherForecastResponseMock = try JSONDecoder().decode(WeatherForecastResponse.self, from: weatherForecastResponseData!)
            return weatherForecastResponseMock
        } catch {
            return nil
        }
    }
}
