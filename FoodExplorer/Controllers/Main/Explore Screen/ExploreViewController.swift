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
    private let scrollView = ExploreUIScrollView()
    private let scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let subView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 690).isActive = true
        return view
    }()

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
        view.addSubview(scrollView)
        scrollView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor
        )
        scrollView.addSubview(scrollStackViewContainer)
        scrollStackViewContainer.anchor(
            top: scrollView.topAnchor,
            leading: scrollView.leadingAnchor,
            trailing: scrollView.trailingAnchor,
            bottom: scrollView.bottomAnchor
        )
        scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        scrollStackViewContainer.addArrangedSubview(subView)
        subView.addSubview(searchField)
        subView.addSubview(headerLabel)
        subView.addSubview(discoveryCollectionView)
        subView.addSubview(footerLabel)
        subView.addSubview(topCategoriesCollectionView)
    }

    private func setupSearchField() {
        searchField.delegate = self
        searchField.anchor(
            top: subView.topAnchor,
            leading: subView.leadingAnchor,
            trailing: subView.trailingAnchor,
            bottom: nil,
            padding: .init(top: 0, left: 16, bottom: 0, right: 16)
        )
    }

    private func setupHeaderLabel() {
        headerLabel.anchor(
            top: searchField.bottomAnchor,
            leading: subView.leadingAnchor,
            trailing: subView.trailingAnchor,
            bottom: nil,
            padding: .init(top: 24, left: 16, bottom: 0, right: 16)
        )
    }

    private func setupDiscoveryCollectionView() {
        discoveryCollectionView.anchor(
            top: headerLabel.bottomAnchor,
            leading: subView.leadingAnchor,
            trailing: subView.trailingAnchor,
            bottom: nil,
            padding: .init(top: 18, left: 0, bottom: 0, right: 0)
        )
        discoveryCollectionView.setCells(restaurants: Restaurant.fetchRestaurants())
    }

    private func setupFooterLabel() {
        footerLabel.anchor(
            top: discoveryCollectionView.bottomAnchor,
            leading: subView.leadingAnchor,
            trailing: subView.trailingAnchor,
            bottom: nil,
            padding: .init(top: 24, left: 16, bottom: 0, right: 16)
        )
    }

    private func setupTopCategoriesCollectionView() {
        topCategoriesCollectionView.anchor(
            top: footerLabel.bottomAnchor,
            leading: subView.leadingAnchor,
            trailing: subView.trailingAnchor,
            bottom: nil,
            padding: .init(top: 16, left: 0, bottom: 0, right: 0)
        )
        topCategoriesCollectionView.setCells(foodCategories: FoodCategory.fetchFoodCategodires())
    }

    // MARK: - Helpers
    // MARK: - Actions
    // MARK: - Objc Methods
}
