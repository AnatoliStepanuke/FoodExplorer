import UIKit

final class DiscoveryTableViewCell: UITableViewCell {
    let collectionView = DiscoveryUICollectionView(
        height: 350,
        lineSpacing: 14,
        scrollDirection: .horizontal,
        cellClass: DiscoveryCollectionViewCell.self,
        identifier: DiscoveryCollectionViewCell.Constants.discoveryCollectionViewCell
    )

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
