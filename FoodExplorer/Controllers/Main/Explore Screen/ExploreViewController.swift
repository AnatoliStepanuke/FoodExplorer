import UIKit

final class ExploreViewController: UIViewController, UITextFieldDelegate {
    // MARK: - Constants
    private let searchField = ExploreUITextField()
    private let galleryCollectionView = ExploreUICollectionView()
    private let headerLabel = UILabel()

    // MARK: - Properties
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupSearchField()
        setupDiscoveryCollectionView()
    }

    // MARK: - Setups
    private func setupView() {
        view.addSubview(searchField)
        view.addSubview(headerLabel)
        view.addSubview(galleryCollectionView)
    }

    private func setupSearchField() {
        searchField.delegate = self
        searchField.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor,
            bottom: nil,
            padding: .init(top: 0, left: 16, bottom: 0, right: 16)
        )
    }

    private func setupDiscoveryCollectionView() {
        headerLabel.text = "Discovery new places"
        headerLabel.anchor(
            top: searchField.bottomAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor,
            bottom: nil,
            padding: .init(top: 24, left: 16, bottom: 0, right: 16)
        )
        headerLabel.font = .systemFont(ofSize: 30, weight: .regular)

        galleryCollectionView.anchor(
            top: headerLabel.bottomAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor,
            bottom: nil,
            padding: .init(top: 20, left: 0, bottom: 0, right: 0)
        )
        galleryCollectionView.heightAnchor.constraint(equalToConstant: 350).isActive = true
        galleryCollectionView.setCells(cells: Restaurant.fetchRestaurants())
    }

    // MARK: - Helpers
    // MARK: - Actions
    // MARK: - Objc Methods
}
