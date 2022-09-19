import UIKit

final class TopCategoriesCollectionViewCell: UICollectionViewCell {
    // MARK: - Constants
    // Private
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let placesLabel = UILabel()

    // MARK: - Properties
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
        setupNameLabel()
        setupPlacesLabel()
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

    private func setupPlacesLabel() {
        self.addSubview(placesLabel)
        placesLabel.anchor(
            top: nameLabel.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 9, left: 0, bottom: 0, right: 0)
        )
    }

    // MARK: - API
    func configure(using foodCategory: FoodCategory) {
        imageView.image = foodCategory.image
        nameLabel.text = foodCategory.name
        placesLabel.text = foodCategory.description
    }
}
