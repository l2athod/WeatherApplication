import Foundation

struct WeatherForecastModel: Decodable {
    let time: String
    let tempreature: Int
    let image: String
}
