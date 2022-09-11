import UIKit

final class GalleryCollectionView: UICollectionView,
                                   UICollectionViewDelegate,
                                   UICollectionViewDataSource,
                                   UICollectionViewDelegateFlowLayout {

    var cells = [Restaurant]()
    private let star = UIImage(named: "star")

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)

        delegate = self
        dataSource = self
        register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.reuseId)

        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = Constants.galleryMinimumLineSpacing
        contentInset = UIEdgeInsets(
            top: 0, left: Constants.leftDistanceToView,
            bottom: 0, right: Constants.rightDistanceToView
        )
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }

    func set(cells: [Restaurant]) {
        self.cells = cells
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: GalleryCollectionViewCell.reuseId,
            for: indexPath
        ) as? GalleryCollectionViewCell else {
            fatalError("DequeueReusableCell failed while casting.")
        }
        cell.imageView.image = cells[indexPath.row].image
        cell.nameLabel.text = cells[indexPath.row].name
        cell.addressLabel.text = cells[indexPath.row].address

        if cells[indexPath.row].isFavorite == true {
            cell.starImageView.image = star
        }

        let attributedString: NSMutableAttributedString = NSMutableAttributedString(
            string: "\(cells[indexPath.row].rating) (120 ratings)"
        )
        attributedString.setColorForText(
            forTextAttribute: "\(cells[indexPath.row].rating)",
            withColor: .black
        )
        attributedString.setColorForText(
            forTextAttribute: "(120 ratings)",
            withColor: AppColor.grayColor2
        )
        cell.ratingLabel.attributedText = attributedString

        if cells[indexPath.row].isFreeDelivery == true {
            cell.freeDeliveryLabel.text = "Free delivery"
        }

        return cell

    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: Constants.galleryItemWidth, height: frame.height)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
