import UIKit

struct Restaurant {
    var image: UIImage
    var name: String
    var address: String
    var isFavorite: Bool
    var rating: Double
    var isFreeDelivery: Bool

    static func fetchRestaurants() -> [Restaurant] {
        let rahatBasserie = Restaurant(
            image: UIImage(named: "rahat") ?? .remove,
            name: "Rahat Basserie",
            address: "124 Levent\u{005C}Beskitas",
            isFavorite: true,
            rating: 4.9,
            isFreeDelivery: true
        )

        let garageBar = Restaurant(
            image: UIImage(named: "garage") ?? .remove,
            name: "Garage Bar",
            address: "124 Levent\u{005C}Beskitas",
            isFavorite: true,
            rating: 4.9,
            isFreeDelivery: true
        )

        return[rahatBasserie, garageBar]
    }
}

struct Constants {
    static let leftDistanceToView: CGFloat = 16
    static let rightDistanceToView: CGFloat = 16
    static let galleryMinimumLineSpacing: CGFloat = 14
    static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.galleryMinimumLineSpacing) / 1.7
}
