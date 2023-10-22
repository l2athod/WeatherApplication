import Foundation

struct Constant {
    static let API_KEY = "8b29190e3d0eb2435315e26125ca6919"
    static let GET = "GET"
    static let Host = "api.openweathermap.org"
    static let WeatherSchema = "https"
    static let CurrentWeatherPath = "/data/2.5/weather"
    static let Forecastpath = "/data/2.5/forecast"
    static let DefaultHeaders: [(String, String)] = [("Content-Type", "application/json")]
}
