//import Foundation
//import CoreLocation
//@testable import WeatherApp
//
//class HomeViewModelMock: HomeViewModelProtocol {
//    let coreLocationServiceMock: LocationService
//    
//    init(coreLocationServiceMock: LocationService) {
//        self.coreLocationServiceMock = coreLocationServiceMock
//    }
//    
//    func getUserLocation(completion: @escaping (WeatherApp.WeatherDataResponse?, CLLocation?) -> Void) {
//        coreLocationServiceMock.requestLocation()
//        guard let location = coreLocationServiceMock.location else{
//            return completion(nil, nil)
//        }
//        
//        coreLocationServiceMock.getUserLocation(location: location) { response, location in
//            completion(response, location)
//        }
//    }
//    
//    func getWeatherForecast(coordinate: CLLocationCoordinate2D, completion: @escaping (WeatherApp.WeatherForecastResponse?) -> Void) {
//        guard coreLocationServiceMock.isValidLocation(coordinate: coordinate) else {
//            return completion(nil)
//        }
//        completion(weatherForecastResponseMock)
//    }
//}
