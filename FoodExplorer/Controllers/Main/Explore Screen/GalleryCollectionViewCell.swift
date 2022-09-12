import UIKit

final class GalleryCollectionViewCell: UICollectionViewCell {
    // MARK: - Constants
    // Private
    private let horizontalStackView = UIStackView()

    // Public
    let imageView = ExploreUIImageView(contentMode: .scaleToFill, cornerRadius: 6)
    let nameLabel = UILabel()
    let addressLabel = UILabel()
    let starImageView = ExploreUIImageView(contentMode: .scaleAspectFit, cornerRadius: nil)
    let ratingLabel = UILabel()
    let freeDeliveryLabel = UILabel()

    // MARK: - Type constants
    static let reuseId = "GalleryCollectionViewCell"

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
        horizontalStackView.anchor(
            top: addressLabel.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 10, left: 0, bottom: 0, right: 0)
        )
        horizontalStackView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        horizontalStackView.addArrangedSubview(starImageView)
        horizontalStackView.addArrangedSubview(ratingLabel)
        horizontalStackView.addArrangedSubview(freeDeliveryLabel)
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .center
        horizontalStackView.distribution = .equalSpacing
        ratingLabel.font = .systemFont(ofSize: 14, weight: .regular)
        freeDeliveryLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        freeDeliveryLabel.widthAnchor.constraint(equalToConstant: 78).isActive = true
        freeDeliveryLabel.backgroundColor = AppColor.redColor
        freeDeliveryLabel.font = .systemFont(ofSize: 10, weight: .regular)
        freeDeliveryLabel.textColor = .white
        freeDeliveryLabel.textAlignment = .center
        freeDeliveryLabel.layer.cornerRadius = 9
        freeDeliveryLabel.clipsToBounds = true
    }
}
