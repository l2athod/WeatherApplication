import Foundation

struct WeatherReportModel: Decodable {
    let date: Date
    let day: String
    let weatherReport: [WeatherForecastModel]?
}
