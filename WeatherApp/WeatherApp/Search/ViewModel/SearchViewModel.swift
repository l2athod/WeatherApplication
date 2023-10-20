import Foundation

protocol SearchViewModelProtocol: AnyObject {
    func getWeather(city: String, completion: @escaping (WeatherDataResponse?) -> Void)
}

class SearchViewModel: SearchViewModelProtocol {
    private var weatherService: IWeatherService
    private var detailCoreDataService: IWeatherCoreDataService
    
    init(weatherService: IWeatherService = WeatherService(), detailCoreDataService: IWeatherCoreDataService = WeatherCoreDataService()) {
        self.weatherService = weatherService
        self.detailCoreDataService = detailCoreDataService
    }
    
    func getWeather(city: String, completion: @escaping (WeatherDataResponse?) -> Void) {
        weatherService.getWeather(type: WeatherDataResponse.self, city: city) { response in
            switch response {
                case .success(let response):
                    completion(response)
                case .failure:
                    completion(nil)
            }
        }
    }
    
    func fetchDetailCardCoreDataList() -> [DetailCardModel] {
        return detailCoreDataService.fetch() ?? []
    }
    
    func saveCDEntity<T: Decodable>(city: String, data: T) {
        let response = detailCoreDataService.fetchById(city: city.capitalized)
        guard response != nil else {
            _ = detailCoreDataService.insert(data: data as! DetailCardModel)
            return
        }
        _ = detailCoreDataService.update(data: data as! DetailCardModel)
    }
}
