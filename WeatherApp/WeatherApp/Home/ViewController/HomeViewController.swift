import UIKit
import CoreLocation
import Combine

protocol HomeViewControllerDelegate: AnyObject {
    func navigateToWeatherReport(todayweatherforecast: [TodayWeatherModel], forecastresponse: WeatherForecastResponse?)
}

class HomeViewController: UIViewController {
    private var timer = Timer()
    private var location: CLLocation? = nil
    private var weatherForecaseData: WeatherForecastResponse? = nil
    private var subscriptions = Set<AnyCancellable>()
    
    private lazy var homeView: HomeView! = {
       let homeView = HomeView()
        homeView.translatesAutoresizingMaskIntoConstraints = false
        return homeView
    }()
    private lazy var homeViewModel: HomeViewModel! = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        homeView.delegate = self
        
        setupViews()
        fetchWeatherInfo()
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(fetchWeatherInfo), userInfo: nil, repeats: true)
    }
    
    private func setupViews() {
        view.overrideUserInterfaceStyle = .dark
        view.addSubview(homeView)
        
        NSLayoutConstraint.activate([
            homeView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            homeView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            homeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    
    @objc private func fetchWeatherInfo() {
        homeViewModel.getCurrentWeather { [weak self] (response, location) in
            guard let response = response else { return }
            
            let locationText = response.name!
            let weatherImage = response.weather!.first!.icon!
            let tempreature = (Int(response.main!.temp! - 273))
            let tempreatureInfoText = self?.attributedText(title: "Temp\n", text: "\(tempreature)c").string
            let humidityInfoText = self?.attributedText(title: "Humidity\n", text: "\(response.main!.humidity!)%").string
            let windInfoText = self?.attributedText(title: "Wind\n", text: "\(Int(response.wind!.speed!))km/h").string

            let homedata = HomeDataModel(loction: locationText, weatherImage: weatherImage, tempreature: "\(tempreature) c", tempreatureInfo: tempreatureInfoText!, humidity: humidityInfoText!, wind: windInfoText!)
            self?.homeView.configure(data: homedata)
            self?.location = location
            self?.fetchWeatherForecast()
        }
        
    }
    
    private func fetchWeatherForecast() {
        guard let location = location else { return }
        homeViewModel.getWeatherForecast(location: location) { [weak self] response in
            guard let respone = response else { return }
            self?.weatherForecaseData = respone
            let todayforecast = respone.list?.filter({
                let date = $0.dtTxt?.convertDateFormat(from: "yyyy-MM-dd HH:mm:ss", to: "yyyy-MM-dd")
                let calender = Calendar.current
                let currentdate = Date()
                return calender.isDate(date!.convertDate(format: "yyyy-MM-dd"), inSameDayAs: currentdate)
            })
            
            let todayforecastmodel = todayforecast?.compactMap({ data in
                let image = WeatherImage(rawValue: data.weather!.first!.icon!)!.weatherImage
                let time = data.dtTxt?.convertDateFormat(from: "yyyy-MM-dd HH:mm:s", to: "hh:mma")
                let tempreature = Int((data.main?.temp)! - 273)
                let tempreatureInfoText = self?.getInfoText(time: time!, tempreature: String(tempreature))
                return TodayWeatherModel(image: image, tempreatureInfo: tempreatureInfoText)
            })
            
            self?.homeView.configure(forecastresponse: respone, data: todayforecastmodel!)
        }
    }
    
    private func getInfoText(time: String, tempreature: String) -> NSAttributedString? {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        
        let titleAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.robotoSlabMedium(ofSize: 12)!, .paragraphStyle: paragraphStyle]
        let textAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.robotoSlabMedium(ofSize: 18)!, .paragraphStyle: paragraphStyle]
        
        let timeAttributedString = NSAttributedString(string: time.appending("\n"), attributes: titleAttributes)
        let temperatureAttributedString = NSAttributedString(string: "\(tempreature)c", attributes: textAttributes)
        
        let text = NSMutableAttributedString()
        text.append(timeAttributedString)
        text.append(temperatureAttributedString)
        
        return text
    }
    
    func attributedText(title: String, text: String) -> NSAttributedString {
        let titleAtrributes: [NSAttributedString.Key: Any] = [.font: UIFont.robotoSlabMedium(ofSize: 12)!]
        let textAtttributes: [NSAttributedString.Key: Any] = [.font: UIFont.robotoSlabMedium(ofSize: 18)!]
        let result = NSMutableAttributedString(string: title, attributes: titleAtrributes)
        result.append(NSAttributedString(string: text, attributes: textAtttributes))
        return result
    }
}

extension HomeViewController: HomeViewControllerDelegate {
    func navigateToWeatherReport(todayweatherforecast: [TodayWeatherModel], forecastresponse: WeatherForecastResponse?) {
        let weatherReportViewController = WeatherReportViewController(todayweatherforecast: todayweatherforecast, forecastresponse: forecastresponse)
        navigationController?.pushViewController(weatherReportViewController, animated: true)
    }
}
