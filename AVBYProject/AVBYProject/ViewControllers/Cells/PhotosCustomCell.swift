import UIKit

final class PhotosCustomCell: UICollectionViewCell {
    // MARK: - Private variables

    private var imageView = UIImageView()

    // MARK: - Lyfe cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutImageView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    private func layoutImageView() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ])
    }

    func setupImage(image: UIImage?) {
        imageView.image = image ?? UIImage()
        imageView.contentMode = .scaleAspectFill
    }
}
