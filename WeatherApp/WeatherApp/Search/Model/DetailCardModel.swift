import Foundation
import UIKit
import CoreData

class DetailCardModel: Decodable {
    let id: UUID
    let tempreature: Double
    let image: String
    let weatherdescription: String
    let location: String
    let lat: Double?
    let long: Double?
    let tempreatureInfo: String
    
    init(id: UUID = UUID(), tempreature: Double, image: String, weatherdescription: String, location: String, lat: Double? = nil, long: Double? = nil, tempreatureInfo: String) {
        self.id = id
        self.tempreature = tempreature
        self.image = image
        self.weatherdescription = weatherdescription
        self.location = location
        self.lat = lat
        self.long = long
        self.tempreatureInfo = tempreatureInfo
    }
}
