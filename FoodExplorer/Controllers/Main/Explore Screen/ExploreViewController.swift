import UIKit

final class ExploreViewController: UIViewController, UITextFieldDelegate {
    // MARK: - Constants
    private let discoveryCollectionView = DiscoveryUICollectionView(
        height: 350,
        lineSpacing: DiscoveryCollectionViewCell.Constants.galleryMinimumLineSpacing,
        scrollDirection: .horizontal,
        cellClass: DiscoveryCollectionViewCell.self,
        identifier: DiscoveryCollectionViewCell.Constants.discoveryCollectionViewCell
    )
    private let topCategoriesCollectionView = TopCategoriesUICollectionView(
        height: 140,
        lineSpacing: 16,
        scrollDirection: .horizontal,
        cellClass: TopCategoriesCollectionViewCell.self,
        identifier: TopCategoriesCollectionViewCell.Constants.topCategoriesCollectionViewCell
    )
    private let headerLabel = ExploreUILabel(text: "Discovery new places", height: 36, fontSize: 30, fontColor: .black)
    private let footerLabel = ExploreUILabel(text: "Top categories", height: 24, fontSize: 20, fontColor: .black)
    private let searchField = ExploreUITextField()

    // MARK: - Properties
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupSearchField()
        setupHeaderLabel()
        setupDiscoveryCollectionView()
        setupFooterLabel()
        setupTopCategoriesCollectionView()
    }

    // MARK: - Setups
    private func setupView() {
        view.addSubview(searchField)
        view.addSubview(headerLabel)
        view.addSubview(discoveryCollectionView)
        view.addSubview(footerLabel)
        view.addSubview(topCategoriesCollectionView)
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

    private func setupHeaderLabel() {
        headerLabel.anchor(
            top: searchField.bottomAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor,
            bottom: nil,
            padding: .init(top: 24, left: 16, bottom: 0, right: 16)
        )
    }

    private func setupDiscoveryCollectionView() {
        discoveryCollectionView.anchor(
            top: headerLabel.bottomAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor,
            bottom: nil,
            padding: .init(top: 20, left: 0, bottom: 0, right: 0)
        )
        discoveryCollectionView.setCells(restaurants: Restaurant.fetchRestaurants())
    }

    private func setupFooterLabel() {
        footerLabel.anchor(
            top: discoveryCollectionView.bottomAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor,
            bottom: nil,
            padding: .init(top: 24, left: 16, bottom: 0, right: 16)
        )
    }

    private func setupTopCategoriesCollectionView() {
        topCategoriesCollectionView.anchor(
            top: footerLabel.bottomAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor,
            bottom: nil,
            padding: .init(top: 16, left: 0, bottom: 0, right: 0)
        )
        topCategoriesCollectionView.setCells(foodCategories: FoodCategory.fetchFoodCategodires())
        topCategoriesCollectionView.backgroundColor = .cyan
    }

    // MARK: - Helpers
    // MARK: - Actions
    // MARK: - Objc Methods
}
