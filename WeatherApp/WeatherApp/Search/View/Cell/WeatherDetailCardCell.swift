import Foundation
import UIKit

class WeatherDetailCardCell: UICollectionViewCell {
    static let identifier = String(describing: WeatherDetailCardCell.self)
    
    private lazy var tempreatureLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .robotoSlabMedium(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var imageView: UIImageView! = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),
        ])
        return imageView
    }()
    
    private lazy var weatherLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        label.font = .robotoSlabLight(ofSize: 16)
        return label
    }()
    
    private lazy var locationLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .robotoSlabMedium(ofSize: 20)
        return label
    }()
    
    private lazy var stackView: UIStackView! = {
        let stack = UIStackView(arrangedSubviews: [tempreatureLabel, imageView, weatherLabel, locationLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 1
        
        stack.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
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
        self.layer.cornerRadius = 16
        self.applyShadow(color: ColorTheme.shadowColor, opacity: 1, radius: 5, offset: CGSize(width: 0, height: 5))
        
        self.contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
    
    func configure(indexPath: IndexPath? = nil, data: DetailCardModel) {
        if indexPath?.row == 0 {
            self.backgroundColor = ColorTheme.collectionViewCellColor
        } else {
            self.backgroundColor = .white
        }
        tempreatureLabel.text = data.tempreatureInfo
        imageView.image = UIImage(named: data.image)
        weatherLabel.text = data.weatherdescription
        locationLabel.text = data.location
    }
}
