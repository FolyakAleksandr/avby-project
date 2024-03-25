import UIKit

class CarsCustomCell: UITableViewCell {
    // MARK: - Private properties

    private let mainView = UIView()

    private let bookmarkButton = UIButton()
    private let imageViewForButton = UIImageView()

    private let nameCarLabel = UILabel()
    private let priceCarLabel = UILabel()

    private let layoutCollectionView = UICollectionViewFlowLayout()
    private let carPhotosCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    private var photos = [UIImage?]() {
        didSet {
            carPhotosCollectionView.reloadData()
        }
    }

    // MARK: - Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        layoutAllUIElements()
        appearanceMainView()
        appearanceBookmarkButton()
        configureNameCarLabel()
        configureCollectionView()
        configureLayoutCollectionView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    private func layoutAllUIElements() {
        contentView.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false

        bookmarkButton.addSubview(imageViewForButton)
        imageViewForButton.translatesAutoresizingMaskIntoConstraints = false

        for elem in [bookmarkButton, nameCarLabel, priceCarLabel, carPhotosCollectionView] {
            mainView.addSubview(elem)
            elem.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            // mainView
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),

            // bookmarkButton
            bookmarkButton.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 14),
            bookmarkButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            bookmarkButton.widthAnchor.constraint(equalToConstant: 23),
            bookmarkButton.heightAnchor.constraint(equalToConstant: 22),

            // imageViewForButton
            imageViewForButton.topAnchor.constraint(equalTo: bookmarkButton.topAnchor, constant: 0),
            imageViewForButton.leadingAnchor.constraint(equalTo: bookmarkButton.leadingAnchor, constant: 0),
            imageViewForButton.trailingAnchor.constraint(equalTo: bookmarkButton.trailingAnchor, constant: 0),
            imageViewForButton.bottomAnchor.constraint(equalTo: bookmarkButton.bottomAnchor, constant: 0),

            // nameCarLabel
            nameCarLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 14),
            nameCarLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            nameCarLabel.trailingAnchor.constraint(equalTo: bookmarkButton.leadingAnchor, constant: 0),

            // priceCarLabel
            priceCarLabel.topAnchor.constraint(equalTo: nameCarLabel.bottomAnchor, constant: 7),
            priceCarLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),

            // carPhotosCollectionView
            carPhotosCollectionView.topAnchor.constraint(equalTo: priceCarLabel.bottomAnchor, constant: 10),
            carPhotosCollectionView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            carPhotosCollectionView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            carPhotosCollectionView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -16),
            carPhotosCollectionView.heightAnchor.constraint(equalToConstant: 230)
        ])
    }

    private func appearanceMainView() {
        mainView.backgroundColor = UIColor(named: "backgoundCustomCell")
        mainView.layer.cornerRadius = 8
    }

    private func appearanceBookmarkButton() {
        imageViewForButton.tintColor = UIColor(named: "tint-bookmarkButton")
        imageViewForButton.image = UIImage(systemName: "bookmark")
    }

    private func configureNameCarLabel() {
        nameCarLabel.text = "Peugeot 107 | · Рестайлинг"
        nameCarLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }

    private func configureCollectionView() {
        carPhotosCollectionView.dataSource = self
        carPhotosCollectionView.delegate = self
        carPhotosCollectionView.register(PhotosCustomCell.self, forCellWithReuseIdentifier: "PhotosCustomCell")
        carPhotosCollectionView.setCollectionViewLayout(layoutCollectionView, animated: true)
        carPhotosCollectionView.showsHorizontalScrollIndicator = false
        carPhotosCollectionView.backgroundColor = .clear
        carPhotosCollectionView.layer.cornerRadius = 5
    }

    private func configureLayoutCollectionView() {
        layoutCollectionView.scrollDirection = .horizontal
        layoutCollectionView.estimatedItemSize = .zero
    }

    // MARK: - Public method

    func setupInfoCar(model: Car) {
        nameCarLabel.text = model.name.rawValue + model.restyling.rawValue
        photos = model.imageCar

        let price: NSNumber = model.price.rawValue as NSNumber
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = " "
        numberFormatter.groupingSize = 3
        numberFormatter.usesGroupingSeparator = true
        let priceRubles = numberFormatter.string(from: price) ?? ""
        let priceDollars = numberFormatter.string(from: ((price as! Int) / 92) as NSNumber) ?? ""
        let strRubles = " р.  "
        let strAbout = "≈ "
        let strDollar = "$"

        let attributesForPriceRubles: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: "colorText") ?? UIColor.black,
            .font: UIFont.systemFont(ofSize: 22, weight: .black)
        ]
        let attributesForRubles: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(named: "colorText") ?? UIColor(),
            .font: UIFont.systemFont(ofSize: 14, weight: .bold)
        ]
        let attibutesForZnakAndDollar: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor(named: "colorDollar") ?? UIColor()
        ]

        let attrString1 = NSAttributedString(string: priceRubles, attributes: attributesForPriceRubles)
        let attrString2 = NSAttributedString(string: priceDollars, attributes: attibutesForZnakAndDollar)
        let attrString3 = NSAttributedString(string: strRubles, attributes: attributesForRubles)
        let attrString4 = NSAttributedString(string: strAbout, attributes: attibutesForZnakAndDollar)
        let attrString5 = NSAttributedString(string: strDollar, attributes: attibutesForZnakAndDollar)

        let mutableString = NSMutableAttributedString()
        [attrString1, attrString3, attrString4, attrString2, attrString5].forEach { mutableString.append($0) }
        priceCarLabel.attributedText = mutableString
    }
}

// MARK: - Extension

extension CarsCustomCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCustomCell", for: indexPath) as? PhotosCustomCell else { return UICollectionViewCell() }
        cell.setupImage(image: photos[indexPath.item] ?? UIImage())
        cell.clipsToBounds = true
        return cell
    }
}

extension CarsCustomCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let image = photos[indexPath.item]
        let imageWidth = (image?.size.width ?? 0)
        var itemWidth = 0.0

        if imageWidth > 1000 {
            itemWidth = imageWidth / 3.6
        } else {
            itemWidth = imageWidth / 4.0
        }
        return CGSize(width: itemWidth, height: 230)
    }
}
