import UIKit

final class GalleryCollectionViewCell: UICollectionViewCell {
    // MARK: - Constants
    static let reuseId = "GalleryCollectionViewCell"
    private let horizontalStackView = UIStackView()

    // MARK: - Properties
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let addressLabel = UILabel()
    let starImageView = UIImageView()
    let ratingLabel = UILabel()

    // MARK: - Properties
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
        setupNameLabel()
        setupAddressLabel()
        setupHorizontalStackView()
    }

    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups
    private func setupImageView() {
        self.addSubview(imageView)
        imageView.anchor(
            top: topAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil
        )
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
    }

    private func setupNameLabel() {
        self.addSubview(nameLabel)
        nameLabel.anchor(
            top: imageView.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 18, left: 0, bottom: 0, right: 0)
        )
        nameLabel.font = .systemFont(ofSize: 18, weight: .regular)
        nameLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    }

    private func setupAddressLabel() {
        self.addSubview(addressLabel)
        addressLabel.anchor(
            top: nameLabel.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 9, left: 0, bottom: 0, right: 0)
        )
        addressLabel.font = .systemFont(ofSize: 14, weight: .regular)
        addressLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        addressLabel.textColor = AppColor.grayColor2
    }

    private func setupHorizontalStackView() {
        self.addSubview(horizontalStackView)
        self.addSubview(starImageView)
        starImageView.contentMode = .scaleAspectFit
        self.addSubview(ratingLabel)
        ratingLabel.font = .systemFont(ofSize: 14, weight: .regular)
        horizontalStackView.anchor(
            top: addressLabel.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 10, left: 0, bottom: 0, right: 0)
        )
        horizontalStackView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .leading
        horizontalStackView.distribution = .fillProportionally
        horizontalStackView.addArrangedSubview(starImageView)
        horizontalStackView.addArrangedSubview(ratingLabel)
    }
}
