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
        imageView.heightAnchor.constraint(equalToConstant: 88).isActive = true
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .blue
    }

    private func setupNameLabel() {
        self.addSubview(nameLabel)
        nameLabel.anchor(
            top: imageView.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 8, left: 0, bottom: 0, right: 0)
        )
        nameLabel.font = .systemFont(ofSize: 18, weight: .regular)
        nameLabel.textColor = .black
        nameLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    }

    private func setupPlacesLabel() {
        self.addSubview(placesLabel)
        placesLabel.anchor(
            top: nameLabel.bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor,
            bottom: nil,
            padding: .init(top: 5, left: 0, bottom: 0, right: 0)
        )
        placesLabel.font = .systemFont(ofSize: 14, weight: .regular)
        placesLabel.textColor = AppColor.grayColor2
        placesLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    // MARK: - API
    func configure(using foodCategory: FoodCategory) {
        imageView.image = foodCategory.image
        nameLabel.text = foodCategory.name
        placesLabel.text = foodCategory.description
    }
}
