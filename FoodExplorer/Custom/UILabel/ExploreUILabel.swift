import UIKit

final class ExploreUILabel: UILabel {
    // MARK: - Init
    init(
        text: String = "",
        height: CGFloat,
        fontSize: CGFloat,
        fontAlignment: NSTextAlignment = .left,
        fontWeight: UIFont.Weight = .regular,
        fontColor: UIColor,
        backgroundColor: UIColor = .clear,
        cornerRadius: CGFloat = 0
    ) {
        super.init(frame: .zero)
        setupConstraintsExploreUILabel(height: height)
        setupFontExploreUILabel(
            text: text,
            size: fontSize,
            weight: fontWeight,
            color: fontColor,
            alignment: fontAlignment
        )
        setupBackgroundExploreUILabel(color: backgroundColor, radius: cornerRadius)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups
    private func setupConstraintsExploreUILabel(height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    private func setupFontExploreUILabel(
        text: String,
        size ofSize: CGFloat,
        weight: UIFont.Weight,
        color: UIColor,
        alignment: NSTextAlignment
    ) {
        self.text = text
        font = .systemFont(ofSize: ofSize, weight: weight)
        textColor = color
        textAlignment = alignment
    }

    private func setupBackgroundExploreUILabel(color: UIColor, radius: CGFloat) {
        backgroundColor = color
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}
