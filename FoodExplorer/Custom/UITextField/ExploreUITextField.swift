import UIKit

final class ExploreUITextField: UITextField {
    // MARK: - Init
    init(
        height: CGFloat = 42,
        cornerRadius: CGFloat? = 21,
        borderWidth: CGFloat? = 1,
        borderColor: CGColor? = UIColor(red: 0.78, green: 0.792, blue: 0.82, alpha: 1).cgColor,
        iconName: String? = "search",
        iconPositionX: Int? = 15,
        iconPositionY: Int? = 0,
        iconWidth: Int? = 16,
        iconHeight: Int? = 17,
        viewPositionX: Int? = 0,
        viewPositionY: Int? = 0,
        viewWidth: Int? = 40,
        viewHeight: Int? = 20,
        autocapitalizationType: UITextAutocapitalizationType? = .words,
        keyboardType: UIKeyboardType? = .default
    ) {
        super.init(frame: .zero)
        setupHeight(height: height)
        setupBorder(
            cornerRadius: cornerRadius,
            borderWidth: borderWidth,
            borderColor: borderColor
        )
        setupIcon(
            iconName: iconName,
            iconPositionX: iconPositionX,
            iconPositionY: iconPositionY,
            iconWidth: iconWidth,
            iconHeight: iconHeight,
            viewPositionX: viewPositionX,
            viewPositionY: viewPositionY,
            viewWidth: viewWidth,
            viewHeight: viewHeight
        )
        setupKeyboardType(
            autocapitalizationType: autocapitalizationType,
            keyboardType: keyboardType
        )
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Setups
    private func setupHeight(height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    private func setupBorder(
        cornerRadius: CGFloat?,
        borderWidth: CGFloat?,
        borderColor: CGColor?
    ) {
        layer.cornerRadius = cornerRadius ?? 0
        layer.borderWidth = borderWidth ?? 0
        layer.borderColor = borderColor
    }

    private func setupIcon(
        iconName: String?,
        iconPositionX: Int? = 0,
        iconPositionY: Int? = 0,
        iconWidth: Int?,
        iconHeight: Int?,
        viewPositionX: Int? = 0,
        viewPositionY: Int? = 0,
        viewWidth: Int?,
        viewHeight: Int?
    ) {
        let imageView = UIImageView(frame: CGRect(
            x: iconPositionX ?? 0,
            y: iconPositionY ?? 0,
            width: iconWidth ?? 0,
            height: iconHeight ?? 0
        ))
        let iconImage = UIImage(named: iconName ?? "")
        let view = UIView(frame: CGRect(
            x: viewPositionX ?? 0,
            y: viewPositionY ?? 0,
            width: viewWidth ?? 0,
            height: viewHeight ?? 0
        ))
        imageView.image = iconImage
        view.addSubview(imageView)
        leftView = view
        leftViewMode = .always
    }

    private func setupKeyboardType(
        autocapitalizationType: UITextAutocapitalizationType?,
        keyboardType: UIKeyboardType?
    ) {
        self.keyboardType = keyboardType ?? .default
        self.autocapitalizationType = autocapitalizationType ?? .none
        autocorrectionType = .no
        returnKeyType = UIReturnKeyType.continue
    }
}
