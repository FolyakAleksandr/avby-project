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

    private let descriptionLabel = UILabel()

    private let stackTwoViews: UIStackView = {
        let stackTwoViews = UIStackView()
        stackTwoViews.axis = .horizontal
        stackTwoViews.distribution = .fillProportionally
        stackTwoViews.alignment = .fill
        stackTwoViews.spacing = 3
        return stackTwoViews
    }()

    private let topView: UIView = {
        let topView = UIView()
        topView.backgroundColor = UIColor(named: "topView")
        topView.layer.cornerRadius = 2
        return topView
    }()

    private let nameTopView: UILabel = {
        let nameTopView = UILabel()
        nameTopView.text = "ТОП"
        nameTopView.textColor = .black
        nameTopView.font = UIFont.systemFont(ofSize: 11, weight: UIFont.Weight.bold)
        return nameTopView
    }()

    private let imageTopView = UIImageView()

    private let vinView: UIView = {
        let vinView = UIView()
        vinView.backgroundColor = UIColor(named: "vinView")
        vinView.layer.cornerRadius = 2
        return vinView
    }()

    private let nameVinView: UILabel = {
        let nameVinView = UILabel()
        nameVinView.text = "VIN"
        nameVinView.textColor = .white
        nameVinView.font = UIFont.systemFont(ofSize: 11, weight: UIFont.Weight.bold)
        return nameVinView
    }()

    private let imageVinView = UIImageView()

    private let placeSaleLabel = UILabel()

    private let infoCar = Car.addCar()
    private let dateSale = Car.dateSale()

    private let line: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray4
        return line
    }()

    private let creditView: UIView = {
        let creditView = UIView()
        creditView.backgroundColor = .clear
        return creditView
    }()

    private let creditLabel: UILabel = {
        let creditLabel = UILabel()
        creditLabel.text = "Кредит"
        creditLabel.font = UIFont.systemFont(ofSize: 14)
        creditLabel.textColor = UIColor(named: "creditColor")
        return creditLabel
    }()

    private let priceCreditLabel = UILabel()

    // MARK: - Private Variables

    private var tapMainView = UITapGestureRecognizer()
    private var counterForBookmarkButton = 0
    private var priceCredit = 0

    // MARK: - Public Variables

    public var closure: (() -> ())?
    public var closureBookmarkButton: (() -> ())?
    public var closureForMainView: (() -> ())?

    // MARK: - Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        layoutAllUIElements()
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods
    
    private func setupUI() {
        appearanceMainView()
        appearanceBookmarkButton()
        configureNameCarLabel()
        configureCollectionView()
        configureLayoutCollectionView()
        settingStackTwoViews()
        setupPlaceSaleLabel()
        tapGestureRecognizer()
        logicBookmarkButton()
        settingGestureRecognizer()
    }

    private func layoutAllUIElements() {
        contentView.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false

        bookmarkButton.addSubview(imageViewForButton)
        imageViewForButton.translatesAutoresizingMaskIntoConstraints = false

        for el in [nameTopView, imageTopView] {
            topView.addSubview(el)
            el.translatesAutoresizingMaskIntoConstraints = false
        }

        for el in [nameVinView, imageVinView] {
            vinView.addSubview(el)
            el.translatesAutoresizingMaskIntoConstraints = false
        }

        for elem in [bookmarkButton, nameCarLabel, priceCarLabel, carPhotosCollectionView, descriptionLabel, stackTwoViews, placeSaleLabel, line, creditView, creditLabel, priceCreditLabel] {
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
            carPhotosCollectionView.heightAnchor.constraint(equalToConstant: 230),

            // descriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: carPhotosCollectionView.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),

            // stackTwoViews
            stackTwoViews.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            stackTwoViews.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            stackTwoViews.widthAnchor.constraint(equalToConstant: 100),
            stackTwoViews.heightAnchor.constraint(equalToConstant: 20),

            // nameTopView
            nameTopView.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            nameTopView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -5),

            // imageTopView
            imageTopView.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            imageTopView.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 5),
            imageTopView.widthAnchor.constraint(equalToConstant: 11),
            imageTopView.heightAnchor.constraint(equalToConstant: 10),

            // nameVinView
            nameVinView.centerYAnchor.constraint(equalTo: vinView.centerYAnchor),
            nameVinView.leadingAnchor.constraint(equalTo: vinView.leadingAnchor, constant: 5),

            // imageTopView
            imageVinView.centerYAnchor.constraint(equalTo: vinView.centerYAnchor),
            imageVinView.trailingAnchor.constraint(equalTo: vinView.trailingAnchor, constant: -5),
            imageVinView.widthAnchor.constraint(equalToConstant: 14),
            imageVinView.heightAnchor.constraint(equalToConstant: 13),

            // placeSaleLabel
            placeSaleLabel.topAnchor.constraint(equalTo: stackTwoViews.bottomAnchor, constant: 10),
            placeSaleLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            placeSaleLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 10),

            // line
            line.topAnchor.constraint(equalTo: placeSaleLabel.bottomAnchor, constant: 10),
            line.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            line.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 0),
            line.heightAnchor.constraint(equalToConstant: 0.5),

            // creditView
            creditView.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 10),
            creditView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            creditView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            creditView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -14),
            creditView.heightAnchor.constraint(equalToConstant: 30),

            // creditLabel
            creditLabel.centerYAnchor.constraint(equalTo: creditView.centerYAnchor),
            creditLabel.leadingAnchor.constraint(equalTo: creditView.leadingAnchor, constant: 0),

            // priceCreditLabel
            priceCreditLabel.centerYAnchor.constraint(equalTo: creditView.centerYAnchor),
            priceCreditLabel.trailingAnchor.constraint(equalTo: creditView.trailingAnchor, constant: 0)
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

    private func settingStackTwoViews() {
        [topView, vinView].forEach { stackTwoViews.addArrangedSubview($0) }
        imageTopView.image = UIImage(systemName: "star.fill")
        imageTopView.tintColor = .black
        imageVinView.image = UIImage(systemName: "checkmark")
        imageVinView.tintColor = .white
    }

    private func setupPlaceSaleLabel() {
        placeSaleLabel.font = UIFont.systemFont(ofSize: 14)
        placeSaleLabel.textColor = UIColor(named: "colorPlaceSaleLabel")
    }

    private func tapGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapToCreditView))
        creditView.addGestureRecognizer(tap)
    }

    private func logicBookmarkButton() {
        bookmarkButton.addTarget(self, action: #selector(tapOnBookmarkButton), for: .touchDown)
    }

    private func settingGestureRecognizer() {
        tapMainView = UITapGestureRecognizer(target: self, action: #selector(tapOnMainView))
        mainView.addGestureRecognizer(tapMainView)
    }

    // MARK: - @objc methods

    @objc private func tapToCreditView() {
        closure?()
    }

    @objc private func tapOnBookmarkButton() {
        closureBookmarkButton?()
        if counterForBookmarkButton == 0 {
            imageViewForButton.tintColor = .systemRed
            counterForBookmarkButton += 1
        } else {
            imageViewForButton.tintColor = UIColor(named: "tint-bookmarkButton")
            counterForBookmarkButton = 0
        }
    }

    @objc private func tapOnMainView() {
        closureForMainView?()
    }

    // MARK: - Public method

    func setupInfoCar(model: Car) {
        // NSAttributed for price car
        let price: NSNumber = model.price.rawValue as NSNumber
        let mileage: NSNumber = model.description.mileage.rawValue as NSNumber
        let numberFormatter = NumberFormatter()

        numberFormatter.groupingSeparator = " "
        numberFormatter.groupingSize = 3
        numberFormatter.usesGroupingSeparator = true

        let resultMileage = numberFormatter.string(from: mileage) ?? ""
        let priceRubles = numberFormatter.string(from: price) ?? ""
        let priceDollars = numberFormatter.string(from: ((price as! Int) / 92) as NSNumber) ?? ""

        let strRubles = " р.  "
        let strAbout = "≈ "
        let strDollar = "$"
        let ot = "от "
        let usd = " USD"
        let month = "/месяц"
        priceCredit = model.priceCredit

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
        let attributesForPriceCreditLabel: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold),
            .foregroundColor: UIColor(named: "creditColor") ?? UIColor()
        ]
        let attributesForWords: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor(named: "creditColor") ?? UIColor()
        ]

        let attrString1 = NSAttributedString(string: priceRubles, attributes: attributesForPriceRubles)
        let attrString2 = NSAttributedString(string: priceDollars, attributes: attibutesForZnakAndDollar)
        let attrString3 = NSAttributedString(string: strRubles, attributes: attributesForRubles)
        let attrString4 = NSAttributedString(string: strAbout, attributes: attibutesForZnakAndDollar)
        let attrString5 = NSAttributedString(string: strDollar, attributes: attibutesForZnakAndDollar)

        let attrForPrice = NSAttributedString(string: String(priceCredit), attributes: attributesForPriceCreditLabel)
        let attrForUsd = NSAttributedString(string: usd, attributes: attributesForPriceCreditLabel)
        let attrForOt = NSAttributedString(string: ot, attributes: attributesForWords)
        let attrForMonth = NSAttributedString(string: month, attributes: attributesForWords)

        let mutableString = NSMutableAttributedString()
        [attrString1, attrString3, attrString4, attrString2, attrString5].forEach { mutableString.append($0) }

        let mutablePriceLabel = NSMutableAttributedString()
        [attrForOt, attrForPrice, attrForUsd, attrForMonth].forEach { mutablePriceLabel.append($0) }

        priceCarLabel.attributedText = mutableString
        nameCarLabel.text = model.name.rawValue + model.restyling.rawValue
        photos = model.imageCar
        descriptionLabel.text = "\(model.description.year.rawValue) г., \(model.description.transmission.rawValue), \(model.description.capacity.rawValue) л, \(model.description.typeEngine.rawValue), \(model.description.body.rawValue), \(resultMileage) км"
        descriptionLabel.font = UIFont.systemFont(ofSize: 15)
        placeSaleLabel.text = "\(model.city.rawValue) · \(dateSale)"
        priceCreditLabel.attributedText = mutablePriceLabel
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
