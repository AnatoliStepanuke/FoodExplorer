import UIKit

final class ExploreViewController: UIViewController, UITextFieldDelegate {
    // MARK: - Constants
    private let searchField = ExploreUITextField(
        placeholderText: "Search",
        autocapitalizationType: .words,
        keyboardType: .default
    )

    // MARK: - Properties
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupSearchField()
    }
    // MARK: - Setups
    private func setupView() {
        title = "Explore"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(searchField)
    }

    private func setupSearchField() {
        searchField.delegate = self
        searchField.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor,
            bottom: nil,
            padding: .init(top: 50, left: 16, bottom: 0, right: 16)
        )
        searchField.backgroundColor = .red
    }

    // MARK: - Helpers
    // MARK: - Actions
    // MARK: - Objc Methods
}
