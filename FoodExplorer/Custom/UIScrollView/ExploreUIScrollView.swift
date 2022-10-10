import UIKit

final class ExploreUIScrollView: UIScrollView {
    // MARK: - Constants
    private let scrollView = UIScrollView()

    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: .zero)
        setupExploreUIScrollView()
    }

    // MARK: - Setups
    private func setupExploreUIScrollView() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
