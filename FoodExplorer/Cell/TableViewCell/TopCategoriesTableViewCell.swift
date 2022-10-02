import UIKit

final class TopCategoriesTableViewCell: UITableViewCell {
    // MARK: - Constants
    let collectionView = TopCategoriesUICollectionView(
        height: 140,
        lineSpacing: 16,
        scrollDirection: .horizontal,
        cellClass: TopCategoriesCollectionViewCell.self,
        identifier: TopCategoriesCollectionViewCell.Constants.topCategoriesCollectionViewCell
    )

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        collectionView.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            trailing: contentView.trailingAnchor,
            bottom: contentView.bottomAnchor
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
