import Foundation
import UIKit

protocol SearchViewDelegate: AnyObject {
    func searchLocationWeatherInfo(text: String)
}

class SearchView: UIView {
    weak var delegate: SearchViewDelegate? = nil
    private let locationLabelText = "Pick a location"
    private let infoLabelText = "Type the area or city you want to know the detailed weather information at this time."
    private var detailCardList: [DetailCardModel] = []

    private lazy var scrollView: UIScrollView! = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private lazy var locatioLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .robotoSlabMedium(ofSize: 30)
        label.text = locationLabelText
        label.textColor = .white
        return label
    }()
    
    private lazy var infoLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .robotoSlabLight(ofSize: 15)
        label.text = infoLabelText
        label.textColor = .white
        return label
    }()
    
    private let searchTextField: UITextField = {
        let searchBar = UITextField()
        let placeholderText = "Search"
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
        ]
        let attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: attributes)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.attributedPlaceholder = attributedPlaceholder
        searchBar.autocapitalizationType = .none
        searchBar.autocorrectionType = .no
        searchBar.textColor = .white
        return searchBar
    }()
    
    private let searchIconView: UIImageView = {
        let iconView = UIImageView(image: UIImage(named: "search"))
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            iconView.widthAnchor.constraint(equalToConstant: 24),
        ])
        return iconView
    }()
    
    private let searchView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorTheme.collectionViewCellColor
        view.applyShadow(color: ColorTheme.shadowColor, opacity: 0.3, radius: 4, offset: CGSize(width: 0, height: 4))
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var stackView: UIStackView! = {
        let stack = UIStackView(arrangedSubviews: [locatioLabel, infoLabel, searchView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        return stack
    }()
    
    private lazy var cardCollectionView: UICollectionView! = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 148, height: 180)
        layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 28
        
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
        scrollView.addSubview(stackView)
        scrollView.addSubview(cardCollectionView)
        searchView.addSubview(searchTextField)
        searchView.addSubview(searchIconView)
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 36),
            scrollView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -36),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            
            stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0),
            stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            searchView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            searchView.heightAnchor.constraint(equalToConstant: 60),
            
            searchTextField.leftAnchor.constraint(equalTo: searchView.leftAnchor, constant: 20),
            searchTextField.topAnchor.constraint(equalTo: searchView.topAnchor),
            searchTextField.bottomAnchor.constraint(equalTo: searchView.bottomAnchor),
            searchTextField.rightAnchor.constraint(equalTo: searchIconView.leftAnchor, constant: -8),

            
            searchIconView.rightAnchor.constraint(equalTo: searchView.rightAnchor, constant: -20),
            searchIconView.topAnchor.constraint(equalTo: searchView.topAnchor),
            searchIconView.bottomAnchor.constraint(equalTo: searchView.bottomAnchor),
            
            cardCollectionView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0),
            cardCollectionView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0),
            cardCollectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            
            cardCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
        cardCollectionView.register(WeatherDetailCardCell.self, forCellWithReuseIdentifier: WeatherDetailCardCell.identifier)
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        searchTextField.delegate = self
    }
}

extension SearchView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
            case cardCollectionView:
                return detailCardList.count
            default:
                return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            case cardCollectionView:
                let cell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: WeatherDetailCardCell.identifier, for: indexPath) as? WeatherDetailCardCell
                cell?.configure(indexPath: indexPath, data: detailCardList[indexPath.row])
                return cell!
            default:
                return UICollectionViewCell()
        }
    }
}

extension SearchView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let text = textField.text!
        delegate?.searchLocationWeatherInfo(text: text)
        return true
    }
    
    func configure(data: DetailCardModel) {
        if let index = detailCardList.firstIndex(where: { $0.location.lowercased() == data.location.lowercased() }) {
            detailCardList[index] = data
        } else {
            detailCardList.insert(data, at: 0)
        }
        
        if detailCardList.count > 4 {
            detailCardList.removeLast()
        }
    
        DispatchQueue.main.async { [weak self] in
            self?.cardCollectionView.reloadData()
        }
    }
}
