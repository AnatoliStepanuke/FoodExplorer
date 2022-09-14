import UIKit

final class ExploreUIStackView: UIStackView {
    // MARK: - Init
    init(
        axis: NSLayoutConstraint.Axis,
        alignment: UIStackView.Alignment,
        distribution: UIStackView.Distribution,
        height: CGFloat
    ) {
        super.init(frame: .zero)
        setupConstraintsStackView(height: height)
        setupStackView(axle: axis, stackViewAlignment: alignment, stackViewDistribution: distribution)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups
    private func setupConstraintsStackView(height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    private func setupStackView(
        axle: NSLayoutConstraint.Axis,
        stackViewAlignment: UIStackView.Alignment,
        stackViewDistribution: UIStackView.Distribution
    ) {
        axis = axle
        alignment = stackViewAlignment
        distribution = stackViewDistribution
    }
}
