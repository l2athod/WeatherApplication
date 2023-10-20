//import Foundation
//import CoreLocation
//@testable import WeatherApp
//
//class SearchViewModelMock: SearchViewModelProtocol {
//    let coreLocationServiceMock: LocationService
//    
//    init(coreLocationServiceMock: LocationService) {
//        self.coreLocationServiceMock = coreLocationServiceMock
//    }
//    
//    func getWeatherInfo(locationPlace: String, completion: @escaping (WeatherApp.WeatherDataResponse?) -> Void) {
//        guard !locationPlace.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
//            return completion(nil)
//        }
//        coreLocationServiceMock.getWeatherInfo(locationPlace: locationPlace) { reponse in
//            completion(reponse)
//        }
//    }
//}
