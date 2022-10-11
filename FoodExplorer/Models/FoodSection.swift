import Foundation

// MARK: - Constructs
struct FoodSection {
    let type: FoodSectionType
}

enum FoodSectionType {
    case restaurants([Restaurant])
    case categories([TopCategory])
}
