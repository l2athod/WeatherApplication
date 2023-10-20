import Foundation
import CoreLocation

enum WeatherAPIRouter : APIRouter {
    case getWeather(city: String)
    case getWeatherForecast(lat: String, long: String)
    
    var host: String {
        switch self {
            case .getWeather, .getWeatherForecast: return Constant.Host
        }
    }
    var schema: String {
        switch self {
            case .getWeather, .getWeatherForecast: return Constant.WeatherSchema
        }
    }
    
    var path: String {
        switch self {
            case .getWeather: return  Constant.CurrentWeatherPath
            case .getWeatherForecast: return Constant.Forecastpath
        }
    }
    
    var method: String {
        switch self {
            case .getWeather, .getWeatherForecast: return Constant.GET
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self{
            case .getWeather(let city): return [URLQueryItem(name: "q", value: city), URLQueryItem(name: "appid", value: Constant.APIKey)]
            case .getWeatherForecast(let lat, let long): return [URLQueryItem(name: "lat", value: lat), URLQueryItem(name: "lon", value: long), URLQueryItem(name: "appid", value: Constant.APIKey),]
        }
    }
    
    var headers: [(String, String)] {
        switch self {
            case .getWeather, .getWeatherForecast: return Constant.DefaultHeaders
        }
    }
    
    var statusCode: Int {
        switch self {
            case .getWeather,.getWeatherForecast: return 200
        }
    }
    
    var body: Codable? {
        switch self {
            case .getWeather, .getWeatherForecast: return nil
        }
    }
}
