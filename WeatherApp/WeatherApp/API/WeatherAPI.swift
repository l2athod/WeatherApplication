import Foundation
import UIKit

enum WeatherImage: String, CaseIterable {
    case clearskyL = "01d"
    case clearskyD = "01n"
    case fewcloudsL = "02d"
    case fewcloudsD = "02n"
    case scatteredcloudsL = "03d"
    case scatteredcloudsD = "03n"
    case brokencloudsL = "04d"
    case brokencloudsD = "04n"
    case showerrainL = "09d"
    case showerrainD = "09n"
    case rainL = "10d"
    case rainD = "10n"
    case thunderstormL = "11d"
    case thunderstormD = "11n"
    case snowL = "13d"
    case snowD = "13n"
    case mistL = "50d"
    case mistD = "50n"
    
    var weatherImage: String {
        switch self {
            case .clearskyL, .clearskyD:
                return "clearsky"
            case .fewcloudsL, .fewcloudsD:
                return "fewclouds"
            case .scatteredcloudsL, .scatteredcloudsD:
                return "scatteredclouds"
            case .brokencloudsL, .brokencloudsD:
                return "brokenclouds"
            case .showerrainL, .showerrainD:
                return "showerrain"
            case .rainL, .rainD:
                return "rain"
            case .thunderstormL, .thunderstormD:
                return "thunderstorm"
            case .snowL, .snowD:
                return "snow"
            case .mistL, .mistD:
                return "mist"
        }
    }
}
