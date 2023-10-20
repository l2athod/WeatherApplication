import UIKit

class WeatherDetailViewCell: UICollectionViewCell {
    static let identifier = String(describing: WeatherDetailViewCell.self)
    
    private lazy var imageIcon: UIImageView! = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 70),
            view.heightAnchor.constraint(equalToConstant: 70),
        ])
        return view
    }()
    
    private lazy var tempreatureInfoLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var horizontalStackView: UIStackView! = {
        let stack = UIStackView(arrangedSubviews: [imageIcon, tempreatureInfoLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .center
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
        self.layer.cornerRadius = 30
        self.clipsToBounds = true
        
        contentView.addSubview(horizontalStackView)
        NSLayoutConstraint.activate([
            horizontalStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            horizontalStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -24),
            horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }
    
    func configure(indexPath: IndexPath? = nil, data: TodayWeatherModel) {
        if indexPath?.row == 0 {
            backgroundColor = ColorTheme.collectionViewCellColor
            tempreatureInfoLabel.textColor = .white
        } else {
            backgroundColor = .white
            tempreatureInfoLabel.textColor = .black
        }
        imageIcon.image = UIImage(named: data.image)
        tempreatureInfoLabel.attributedText = data.tempreatureInfo!
    }
}
