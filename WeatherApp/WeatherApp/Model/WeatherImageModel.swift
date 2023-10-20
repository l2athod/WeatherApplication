import Foundation
import UIKit

struct WeatherImageModel: Decodable{
    let image: String
    let title: String
}

let weatherImageData: [WeatherImageModel] = [
    .init(image: "rain", title: "Rain"),
    .init(image: "snow", title: "Drizz"),
    .init(image: "thunderstorm", title: "Thunder"),
    .init(image: "showerrain", title: "Light Rain"),
    .init(image: "fewclouds", title: "Moon Cloud"),
    .init(image: "mist", title: "Fast Wind"),
]

