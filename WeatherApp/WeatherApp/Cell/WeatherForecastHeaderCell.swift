import Foundation
import UIKit

class WeatherForecastHeadercell: UICollectionViewCell {
    static let identifier = String(describing: WeatherForecastHeadercell.self)
    
    private lazy var forecastLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .robotoSlabLight(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.backgroundColor = .backgroundColor
        contentView.addSubview(forecastLabel)
        
        NSLayoutConstraint.activate([
            forecastLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            forecastLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            forecastLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            forecastLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }    
    
    func configure(indexPath: IndexPath? = nil, data: String) {
        forecastLabel.text = data
    }
}
