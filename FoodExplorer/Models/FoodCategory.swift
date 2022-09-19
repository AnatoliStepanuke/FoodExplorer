import UIKit

struct FoodCategory {
    var image: UIImage
    var name: String
    var placesCount: Int

    static func fetchFoodCategodires() -> [FoodCategory] {
        let pizza = FoodCategory(
            image: UIImage(named: "pizza") ?? .remove,
            name: "Pizza",
            placesCount: 2350
        )

        let burgers = FoodCategory(
            image: UIImage(named: "burger") ?? .remove,
            name: "Burgers",
            placesCount: 350
        )

        let steak = FoodCategory(
            image: UIImage(named: "steak") ?? .remove,
            name: "Steak",
            placesCount: 834
        )

        let pasta = FoodCategory(
            image: UIImage(named: "pasta") ?? .remove,
            name: "Pasta",
            placesCount: 150
        )
        return [pizza, burgers, steak, pasta]
    }
}

extension FoodCategory: CustomStringConvertible {
    var description: String {
        "\(placesCount) places"
    }
}
