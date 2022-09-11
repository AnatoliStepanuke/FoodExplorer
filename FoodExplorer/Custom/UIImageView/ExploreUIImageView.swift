import UIKit

final class ExploreUIImageView: UIImageView {
    // MARK: - Init
    init(
        contentMode: UIView.ContentMode,
        cornerRadius: CGFloat?
    ) {
        super.init(frame: .zero)
        setupImageMode(contentMode: contentMode)
        setupImageRound(cornerRadius: cornerRadius)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups
    private func setupImageMode(contentMode mode: UIView.ContentMode) {
        contentMode = mode
    }

    private func setupImageRound(cornerRadius radius: CGFloat?) {
        layer.cornerRadius = radius ?? 0
        clipsToBounds = true
    }
}
