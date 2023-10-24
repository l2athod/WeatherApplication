import Foundation
import UIKit

class WeatherForecastCell: UICollectionViewCell {
    static let identifier = String(describing: WeatherForecastCell.self)
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .robotoSlabMedium(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var tempreatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .robotoSlabMedium(ofSize: 36)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 80)
        ])
        return imageView
    }()
    
    private lazy var weatherReportStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [timeLabel, tempreatureLabel, weatherImage])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.backgroundColor = ColorTheme.collectionViewCellColor
        self.applyShadow(color: ColorTheme.shadowColor, opacity: 1, radius: 5, offset: CGSize(width: 0, height: 5))
        self.layer.cornerRadius = 16

        contentView.addSubview(weatherReportStackView)
        NSLayoutConstraint.activate([
            weatherReportStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            weatherReportStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            weatherReportStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            weatherReportStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -0)
        ])
    }
    
    func configure(indexPath: IndexPath? = nil, data: WeatherForecastModel) {
        timeLabel.text = data.time
        tempreatureLabel.text = data.tempreature
        weatherImage.image = UIImage(named: data.image)
    }
}
