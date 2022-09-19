import UIKit

extension TopCategoriesCollectionViewCell {
    enum Constants {
        static let topCategoriesCollectionViewCell = "TopCategoriesCollectionViewCell"
        static let leftDistanceToView: CGFloat = 16
        static let rightDistanceToView: CGFloat = 16
        static let galleryMinimumLineSpacing: CGFloat = 16
        static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.galleryMinimumLineSpacing) / 1.7
    }
}
