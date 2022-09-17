import UIKit

extension ExploreUICollectionView {
    enum Constants {
        static let reuseId = "GalleryCollectionViewCell"
        static let leftDistanceToView: CGFloat = 16
        static let rightDistanceToView: CGFloat = 16
        static let galleryMinimumLineSpacing: CGFloat = 14
        static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.galleryMinimumLineSpacing) / 1.7
    }
}
