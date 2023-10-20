import Foundation
import UIKit

class WeatherReportView: UIView {
    private let forecastLabelText = "Forecast Report"
    private let todayLabelText = "Today"
    private var todayWeatherforecastList: [TodayWeatherModel] = []
    private var weatherForecastList: [WeatherReportModel] = []
    
    private lazy var scrollView: UIScrollView! = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private lazy var forecastLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .robotoSlabMedium(ofSize: 30)
        label.text = forecastLabelText
        label.textColor = .white
        return label
    }()
    
    private lazy var todayLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = todayLabelText
        label.font = .robotoSlabLight(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private lazy var todayDate: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Date().formatted(date: .abbreviated, time: .omitted)
        label.font = .robotoSlabLight(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private lazy var horizontalStackView: UIStackView! = {
        let stack = UIStackView(arrangedSubviews: [todayLabel, todayDate])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var todayForecastCollectionView: UICollectionView! = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize =  CGSize(width: 166 , height: 85)
        layout.minimumInteritemSpacing = 16
        
        let collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.clipsToBounds = true
        collectionView.applyShadow(color: ColorTheme.shadowColor, opacity: 1, radius: 5, offset: CGSize(width: 0, height: 5))
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private lazy var weatherForecastCollectionView: UICollectionView! = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 340, height: 84)
        layout.minimumLineSpacing = 20
        layout.sectionHeadersPinToVisibleBounds = true
        
        let collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.clipsToBounds = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = ColorTheme.backgroundColor
        addSubview(scrollView)
        scrollView.addSubview(forecastLabel)
        scrollView.addSubview(horizontalStackView)
        scrollView.addSubview(todayForecastCollectionView)
        scrollView.addSubview(weatherForecastCollectionView)
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 24),
            scrollView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -24),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            
            forecastLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            forecastLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            horizontalStackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0),
            horizontalStackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0),
            horizontalStackView.topAnchor.constraint(equalTo: forecastLabel.bottomAnchor, constant: 30),
            horizontalStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            todayForecastCollectionView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0),
            todayForecastCollectionView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0),
            todayForecastCollectionView.topAnchor.constraint(equalTo: horizontalStackView.bottomAnchor, constant: 16),
            todayForecastCollectionView.heightAnchor.constraint(equalToConstant: 84),
            
            weatherForecastCollectionView.topAnchor.constraint(equalTo: todayForecastCollectionView.bottomAnchor, constant: 24),
            weatherForecastCollectionView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0),
            weatherForecastCollectionView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0),
            weatherForecastCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        
        todayForecastCollectionView.register(WeatherDetailViewCell.self, forCellWithReuseIdentifier: WeatherDetailViewCell.identifier)
        todayForecastCollectionView.delegate = self
        todayForecastCollectionView.dataSource = self
        
        weatherForecastCollectionView.register(WeatherForecastCell.self, forCellWithReuseIdentifier: WeatherForecastCell.identifier)
        weatherForecastCollectionView.register(WeatherForecastHeadercell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: WeatherForecastHeadercell.identifier)
        weatherForecastCollectionView.delegate = self
        weatherForecastCollectionView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(orientationDidChange), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc func orientationDidChange() {
        DispatchQueue.main.async { [weak self] in
            self?.weatherForecastCollectionView.reloadData()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    func configure(todayweatherforecast: [TodayWeatherModel], weatherReportList: [WeatherReportModel]) {
        todayWeatherforecastList = todayweatherforecast
        weatherForecastList = weatherReportList
        
        DispatchQueue.main.async { [weak self] in
            self?.todayForecastCollectionView.reloadData()
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.weatherForecastCollectionView.reloadData()
        }
    }
}

extension WeatherReportView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        switch collectionView {
            case todayForecastCollectionView:
                return 1
            case weatherForecastCollectionView:
                return weatherForecastList.count
            default:
                return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
            case todayForecastCollectionView:
                return todayWeatherforecastList.count
            case weatherForecastCollectionView:
                return weatherForecastList[section].weatherReport!.count
            default:
                return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            case todayForecastCollectionView:
                let cell = todayForecastCollectionView.dequeueReusableCell(withReuseIdentifier: WeatherDetailViewCell.identifier, for: indexPath) as? WeatherDetailViewCell
                cell?.configure(indexPath: indexPath, data: todayWeatherforecastList[indexPath.row])
                return cell!
            case weatherForecastCollectionView:
                let cell = weatherForecastCollectionView.dequeueReusableCell(withReuseIdentifier: WeatherForecastCell.identifier, for: indexPath) as? WeatherForecastCell
                cell?.configure(indexPath: indexPath, data: weatherForecastList[indexPath.section].weatherReport![indexPath.row])
                return cell!
            default:
                return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch collectionView {
            case weatherForecastCollectionView:
                switch kind {
                    case UICollectionView.elementKindSectionHeader:
                        let cell = weatherForecastCollectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: WeatherForecastHeadercell.identifier, for: indexPath) as? WeatherForecastHeadercell
                        cell?.configure(indexPath: indexPath, data: weatherForecastList[indexPath.section].day)
                        return cell!
                    default:
                        return UICollectionReusableView(frame: .zero)
                }
            default:
                return UICollectionReusableView(frame: .zero)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch collectionView {
            case weatherForecastCollectionView:
                return CGSize(width: weatherForecastCollectionView.bounds.width, height: 60)
            default:
                return CGSize.zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
}
