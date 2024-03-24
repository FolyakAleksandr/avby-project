import UIKit

class CarsCustomCell: UITableViewCell {
    // MARK: - Private properties

    private let mainView = UIView()

    private let bookmarkButton = UIButton()
    private let imageViewForButton = UIImageView()

    private let nameCarLabel = UILabel()
    private let priceCarLabel = UILabel()

    // MARK: - Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        layoutAllUIElements()
        appearanceMainView()
        appearanceBookmarkButton()
        configureNameCarLabel()
        configurePriceCarLabel()
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

        for elem in [bookmarkButton, nameCarLabel, priceCarLabel] {
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
            priceCarLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -16)
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

    private func configurePriceCarLabel() {
        let priceRubles = String(17630) + " "
        let priceDollars = String(5450) + " "
        let strRubles = "р.  "
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
        mutableString.append(attrString1)
        mutableString.append(attrString3)
        mutableString.append(attrString4)
        mutableString.append(attrString2)
        mutableString.append(attrString5)
        print(mutableString)

        priceCarLabel.attributedText = mutableString
    }
}
