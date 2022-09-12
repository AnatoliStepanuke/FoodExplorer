import UIKit

final class ExploreUILabel: UILabel {
    // MARK: - Init
    init(
        height: CGFloat,
        size: CGFloat,
        weight: UIFont.Weight,
        color: UIColor
    ) {
        super.init(frame: .zero)
        setupConstraintsExploreUILabel(height: height)
        setupFontExploreUILabel(size: size, weight: weight, color: color)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups
    private func setupConstraintsExploreUILabel(height equalToConstant: CGFloat) {
        heightAnchor.constraint(equalToConstant: equalToConstant).isActive = true
    }

    private func setupFontExploreUILabel(size ofSize: CGFloat, weight: UIFont.Weight, color: UIColor) {
        font = .systemFont(ofSize: ofSize, weight: weight)
        textColor = color
    }
}
