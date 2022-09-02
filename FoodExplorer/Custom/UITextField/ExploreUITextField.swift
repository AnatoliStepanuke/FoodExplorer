import UIKit

final class ExploreUITextField: UITextField {
    // MARK: - Init
    init(
        placeholderText: String,
        autocapitalizationType: UITextAutocapitalizationType,
        keyboardType: UIKeyboardType
    ) {
        super.init(frame: .zero)
        setupCenterPlaceholderAligment(placeholderText: placeholderText)
        setupKeyboardType(
            autocapitalizationType: autocapitalizationType,
            keyboardType: keyboardType
        )
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Setups
    private func setupCenterPlaceholderAligment(placeholderText: String) {
        textAlignment = .center
        placeholder = placeholderText
    }

    private func setupKeyboardType(
        autocapitalizationType: UITextAutocapitalizationType,
        keyboardType: UIKeyboardType
    ) {
        self.keyboardType = keyboardType
        self.autocapitalizationType = autocapitalizationType
        autocorrectionType = .no
        returnKeyType = UIReturnKeyType.continue
    }
}
