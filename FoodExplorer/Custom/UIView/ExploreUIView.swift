import UIKit

final class ExploreUIView: UIView {
    // MARK: - Init
    init(
        height: CGFloat
    ) {
        super.init(frame: .zero)
        setupConstraintsUIView(height: height)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups
    private func setupConstraintsUIView(height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
