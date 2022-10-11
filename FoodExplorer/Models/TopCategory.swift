import UIKit

// MARK: - Constructs
struct TopCategory {
    var image: UIImage
    var name: String
    var placesCount: Int
}

// MARK: - Construct extensions
extension TopCategory: CustomStringConvertible {
    var description: String {
        "\(placesCount) places"
    }

    static func fetchTopCategories() -> [TopCategory] {
        let pizza = TopCategory(
            image: UIImage(named: "pizza") ?? .remove,
            name: "Pizza",
            placesCount: 2350
        )

        let burgers = TopCategory(
            image: UIImage(named: "burger") ?? .remove,
            name: "Burgers",
            placesCount: 350
        )

        let steak = TopCategory(
            image: UIImage(named: "steak") ?? .remove,
            name: "Steak",
            placesCount: 834
        )

        let pasta = TopCategory(
            image: UIImage(named: "pasta") ?? .remove,
            name: "Pasta",
            placesCount: 150
        )
        return [pizza, burgers, steak, pasta]
    }
}
