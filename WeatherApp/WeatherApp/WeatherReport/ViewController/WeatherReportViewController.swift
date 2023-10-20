import UIKit

class WeatherReportViewController: UIViewController {
    private var todayWeatherforecastList: [TodayWeatherModel] = []
    private var weatherForecastResponse: WeatherForecastResponse? = nil
    
    private lazy var weatherReportView: WeatherReportView! = {
        let weatherReportView = WeatherReportView()
        weatherReportView.translatesAutoresizingMaskIntoConstraints = false
        return weatherReportView
    }()
    
    init(todayweatherforecast: [TodayWeatherModel], forecastresponse: WeatherForecastResponse? = nil) {
        super.init(nibName: nil, bundle: nil)
        todayWeatherforecastList = todayweatherforecast
        weatherForecastResponse = forecastresponse
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(weatherReportView)
        
        NSLayoutConstraint.activate([
            weatherReportView.leftAnchor.constraint(equalTo: view.leftAnchor),
            weatherReportView.rightAnchor.constraint(equalTo: view.rightAnchor),
            weatherReportView.topAnchor.constraint(equalTo: view.topAnchor),
            weatherReportView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        var weatherForecastData: [String: [List]] = [:]
        weatherForecastResponse?.list?.forEach({ list in
            let componenets = list.dtTxt?.components(separatedBy: " ")
            let date = componenets?.first
            guard let date = date else { return }
            
            if weatherForecastData[date] == nil {
                weatherForecastData[date] = []
            }
            weatherForecastData[date]?.append(list)
        })
        
        var weatherReportModel: [WeatherReportModel] = []
        for (textdate, list) in weatherForecastData {
            
            var weatherForecastList: [WeatherForecastModel] = []
            for record in list {
                let time = record.dtTxt?.convertDateFormat(from: "yyyy-MM-dd HH:mm:ss", to: "hh:mma")
                let tempreature = Int(record.main!.temp! - 273)
                let image = WeatherImage(rawValue: record.weather!.first!.icon!)?.weatherImage
                
                weatherForecastList.append(WeatherForecastModel(time: time!, tempreature: tempreature, image: image!))
            }
            
            let date = textdate.convertDate(format: "yyyy-MM-dd")
            let day = date.convertToString(format: "EEEE")
            weatherReportModel.append(WeatherReportModel(date: date, day: day, weatherReport: weatherForecastList))
        }

        weatherReportModel.sort { $0.date < $1.date }
        weatherReportView.configure(todayweatherforecast: todayWeatherforecastList, weatherReportList: weatherReportModel)
    }
}
