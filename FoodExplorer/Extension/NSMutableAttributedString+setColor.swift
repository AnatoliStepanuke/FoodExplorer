import UIKit

extension NSMutableAttributedString {
    func setColorForText(forTextAttribute: String, withColor color: UIColor) {
        let range: NSRange = mutableString.range(of: forTextAttribute, options: .caseInsensitive)
        addAttribute(
            NSMutableAttributedString.Key.foregroundColor,
            value: color,
            range: range
        )
    }
}
