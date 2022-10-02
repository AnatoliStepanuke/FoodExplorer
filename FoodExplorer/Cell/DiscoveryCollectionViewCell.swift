import UIKit

final class DiscoveryCollectionViewCell: UICollectionViewCell {
    // MARK: - Constants
    // Private
    private let horizontalStackView = ExploreUIStackView(
        axis: .horizontal,
        alignment: .center,
        distribution: .equalSpacing,
        height: 18
    )
    private let imageView = ExploreUIImageView(contentMode: .scaleToFill, cornerRadius: 6)
    private let nameLabel = ExploreUILabel(height: 21, fontSize: 18, fontColor: .black)
    private let addressLabel = ExploreUILabel(
        height: 17,
        fontSize: 14,
        fontColor: AppColor.grayColor2
    )
    private let starImageView = ExploreUIImageView(contentMode: .scaleAspectFit, cornerRadius: nil)
    private let ratingLabel = ExploreUILabel(height: 17, fontSize: 14, fontColor: .black)
    private let freeDeliveryLabel = ExploreUILabel(
        height: 18,
        fontSize: 10,
        fontAlignment: .center,
        fontWeight: .regular,
        fontColor: .white,
        backgroundColor: AppColor.redColor,
        cornerRadius: 9
    )

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
        horizontalStackView.addArrangedSubview(starImageView)
        horizontalStackView.addArrangedSubview(ratingLabel)
        horizontalStackView.addArrangedSubview(freeDeliveryLabel)
        freeDeliveryLabel.widthAnchor.constraint(equalToConstant: 78).isActive = true
    }

    // MARK: - API
    func configure(using restaurant: Restaurant, starImage: UIImage?) {
        imageView.image = restaurant.image
        nameLabel.text = restaurant.name
        addressLabel.text = restaurant.address
        if restaurant.isFavorite == true {
            starImageView.image = starImage
        }

        let attributedString: NSMutableAttributedString = NSMutableAttributedString(
            string: "\(restaurant.rating) (120 ratings)"
        )
        attributedString.setColorForText(
            forTextAttribute: "\(restaurant.rating)",
            withColor: .black
        )
        attributedString.setColorForText(
            forTextAttribute: "(120 ratings)",
            withColor: AppColor.grayColor2
        )
        ratingLabel.attributedText = attributedString

        if restaurant.isFreeDelivery == true {
            freeDeliveryLabel.text = "Free delivery"
        }
    }
}
