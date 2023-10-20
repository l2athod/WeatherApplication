import Foundation
import UIKit

class HomeView: UIView {
    private var timer = Timer()
    weak var delegate: HomeViewControllerDelegate?
    private let todayLabelText = "Today"
    private let viewReportButtonText = "View Report"
    
    private var weatherForecastResponse: WeatherForecastResponse? = nil
    private var todayWeatherforecastList: [TodayWeatherModel] = []
    
    private lazy var weatherImageCollectionView: UICollectionView! = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 16
        
        let view = UICollectionView(frame: bounds, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .collectionViewBackgroundColor
        view.contentInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        view.clipsToBounds = true
        view.applyShadow(color: .shadowColor, opacity: 1, radius: 5, offset: CGSize(width: 0, height: 5))
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    private lazy var scrollView: UIScrollView! = {
       let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private lazy var locationNameLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .robotoSlabMedium(ofSize: 30)
        label.textColor = .white
        return label
    }()
    
    private lazy var dateLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .robotoSlabMedium(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    private lazy var currentLocationImage: UIImageView! = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 155),
            view.heightAnchor.constraint(equalToConstant: 155),
        ])
        return view
    }()
    
    private lazy var tempreatureLabel: UILabel! = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .white
        view.font = .robotoSlabMedium(ofSize: 48)
        return view
    }()
    
    private lazy var tempreatureInfoLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var humidityInfoLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var windInfoLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var weatherInfoHorizontalStackView: UIStackView! = {
        let stack = UIStackView(arrangedSubviews: [tempreatureInfoLabel, humidityInfoLabel, windInfoLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var todayLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = todayLabelText
        label.font = .robotoSlabLight(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private lazy var viewReportButton: UIButton! = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .preferredFont(forTextStyle: .title3)
        button.setTitle(viewReportButtonText, for: .normal)
        button.addTarget(self, action: #selector(viewReportTapped(_:)), for: .touchUpInside)
        button.setTitleColor(.viewReportColor, for: .normal)
        button.titleLabel?.font = .robotoSlabLight(ofSize: 18)
        return button
    }()
    
    private lazy var horizontalStackView: UIStackView! = {
        let stack = UIStackView(arrangedSubviews: [todayLabel, viewReportButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var weatherForecastCollectionView: UICollectionView! = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 166 , height: 85)
        layout.minimumInteritemSpacing = 16
        
        let view = UICollectionView(frame: bounds, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.applyShadow(color: .shadowColor, opacity: 1, radius: 5, offset: CGSize(width: 0, height: 5))
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var stackView: UIStackView! = {
        let stack = UIStackView(arrangedSubviews: [locationNameLabel, dateLabel, currentLocationImage, tempreatureLabel, weatherInfoHorizontalStackView, horizontalStackView, weatherForecastCollectionView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateDateLabel), userInfo: nil, repeats: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .backgroundColor
        addSubview(weatherImageCollectionView)
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            weatherImageCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            weatherImageCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            weatherImageCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            weatherImageCollectionView.heightAnchor.constraint(equalToConstant: 90),
            
            scrollView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 0),
            scrollView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: weatherImageCollectionView.bottomAnchor, constant: 16),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -8),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            weatherInfoHorizontalStackView.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 32),
            weatherInfoHorizontalStackView.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -32),
        
            horizontalStackView.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 24),
            horizontalStackView.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -24),
            
            weatherForecastCollectionView.leftAnchor.constraint(equalTo: stackView.leftAnchor, constant: 16),
            weatherForecastCollectionView.rightAnchor.constraint(equalTo: stackView.rightAnchor, constant: -16),
            weatherForecastCollectionView.heightAnchor.constraint(equalToConstant: 90),
        ])
        weatherImageCollectionView.register(WeatherImageCell.self, forCellWithReuseIdentifier: WeatherImageCell.identifier)
        weatherImageCollectionView.delegate = self
        weatherImageCollectionView.dataSource = self

        weatherForecastCollectionView.register(WeatherDetailViewCell.self, forCellWithReuseIdentifier: WeatherDetailViewCell.identifier)
        weatherForecastCollectionView.delegate = self
        weatherForecastCollectionView.dataSource = self
    }
    
    @objc private func updateDateLabel() {
        dateLabel.text = Date().convertToString(format: "MMM dd, yyyy")
    }
    
    @objc private func viewReportTapped(_ sender: UIButton) {
        delegate?.navigateToWeatherReport(todayweatherforecast: todayWeatherforecastList, forecastresponse: weatherForecastResponse)
    }
}

extension HomeView {
    func configure(data: HomeDataModel) {
        let weatherImage: WeatherImage = WeatherImage(rawValue: data.weatherImage)!
        
        DispatchQueue.main.async { [weak self] in
            self?.locationNameLabel.text = data.loction
            self?.currentLocationImage.image = UIImage(named: weatherImage.weatherImage)
            self?.tempreatureLabel.text = data.tempreature
            self?.tempreatureInfoLabel.attributedText = NSAttributedString(string: data.tempreatureInfo)
            self?.humidityInfoLabel.attributedText = NSAttributedString(string: data.humidity)
            self?.windInfoLabel.attributedText = NSAttributedString(string: data.wind)
        }
    }
    
   
    
    func configure(forecastresponse: WeatherForecastResponse, data: [TodayWeatherModel]) {
        weatherForecastResponse = forecastresponse
        todayWeatherforecastList = data
        
        DispatchQueue.main.async { [weak self] in
            self?.weatherImageCollectionView.reloadData()
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.weatherForecastCollectionView.reloadData()
        }
    }
}

extension HomeView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
            case weatherImageCollectionView:
                return weatherImageData.count
            case weatherForecastCollectionView:
                return todayWeatherforecastList.count
            default:
                return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            case weatherImageCollectionView:
                let cell = weatherImageCollectionView.dequeueReusableCell(withReuseIdentifier: WeatherImageCell.identifier, for: indexPath) as? WeatherImageCell
                cell?.configure(indexPath: indexPath, data: weatherImageData[indexPath.row])
                return cell!
            case weatherForecastCollectionView:
                let cell = weatherForecastCollectionView.dequeueReusableCell(withReuseIdentifier: WeatherDetailViewCell.identifier, for: indexPath) as? WeatherDetailViewCell
                cell?.configure(indexPath: indexPath, data: todayWeatherforecastList[indexPath.row])
                return cell!
            default:
                return UICollectionViewCell()
        }
    }
}
