import UIKit

class SearchViewController: UIViewController {
    private lazy var searchView: SearchView = {
        let searchView = SearchView()
        searchView.translatesAutoresizingMaskIntoConstraints = false
        return searchView
    }()
    private lazy var searchViewModel: SearchViewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchDetailCardList()
    }
    
    private func setupViews() {
        view.addSubview(searchView)
        
        NSLayoutConstraint.activate([
            searchView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            searchView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            searchView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            searchView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        searchView.delegate = self
    }
}

extension SearchViewController: SearchViewDelegate {
    func searchLocationWeatherInfo(text: String) {
        searchViewModel.getWeather(city: text) { [weak self] response in
            guard let response = response else { return }
            var image = "imageError"
            if let weatherIcon = response.weather?.first?.icon {
                image = WeatherImage(rawValue: weatherIcon)?.weatherImage ?? "imageError"
            }
            let tempreature = response.main?.temp ?? -1
            let weatherDescription = response.weather?.first?.main ?? "weatherdescriptionError"
            let location = response.name ?? "locationError"
            let tempreatureInfo = String(Int(response.main?.temp ?? -1) - 273).appending("c")
            let detailCardModel = DetailCardModel(tempreature: tempreature, image: image, weatherdescription: weatherDescription, location: location, lat: response.coord?.lat, long: response.coord?.lon, tempreatureInfo: tempreatureInfo)
            self?.searchViewModel.saveCDEntity(city: text, data: detailCardModel)
            self?.searchView.configure(data: detailCardModel)
        }
    }
    
    private func fetchDetailCardList() {
        let data = searchViewModel.fetchDetailCardCoreDataList()
        data.forEach { response in
            searchView.configure(data: response)
        }
    }
}
