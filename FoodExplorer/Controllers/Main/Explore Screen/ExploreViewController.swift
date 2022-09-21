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
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let subView1: UIView = {
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
        let margins = view.layoutMarginsGuide
        view.addSubview(scrollView)

        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        scrollView.addSubview(subView1)

        scrollStackViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollStackViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollStackViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollStackViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        scrollStackViewContainer.addArrangedSubview(subView1)

        subView1.addSubview(searchField)
        subView1.addSubview(headerLabel)
        subView1.addSubview(discoveryCollectionView)
        subView1.addSubview(footerLabel)
        subView1.addSubview(topCategoriesCollectionView)
    }

    private func setupSearchField() {
        searchField.delegate = self
        searchField.anchor(
            top: subView1.topAnchor,
            leading: subView1.leadingAnchor,
            trailing: subView1.trailingAnchor,
            bottom: nil,
            padding: .init(top: 0, left: 16, bottom: 0, right: 16)
        )
    }

    private func setupHeaderLabel() {
        headerLabel.anchor(
            top: searchField.bottomAnchor,
            leading: subView1.leadingAnchor,
            trailing: subView1.trailingAnchor,
            bottom: nil,
            padding: .init(top: 24, left: 16, bottom: 0, right: 16)
        )
    }

    private func setupDiscoveryCollectionView() {
        discoveryCollectionView.anchor(
            top: headerLabel.bottomAnchor,
            leading: subView1.leadingAnchor,
            trailing: subView1.trailingAnchor,
            bottom: nil,
            padding: .init(top: 18, left: 0, bottom: 0, right: 0)
        )
        discoveryCollectionView.setCells(restaurants: Restaurant.fetchRestaurants())
    }

    private func setupFooterLabel() {
        footerLabel.anchor(
            top: discoveryCollectionView.bottomAnchor,
            leading: subView1.leadingAnchor,
            trailing: subView1.trailingAnchor,
            bottom: nil,
            padding: .init(top: 24, left: 16, bottom: 0, right: 16)
        )
    }

    private func setupTopCategoriesCollectionView() {
        topCategoriesCollectionView.anchor(
            top: footerLabel.bottomAnchor,
            leading: subView1.leadingAnchor,
            trailing: subView1.trailingAnchor,
            bottom: nil,
            padding: .init(top: 16, left: 0, bottom: 0, right: 0)
        )
        topCategoriesCollectionView.setCells(foodCategories: FoodCategory.fetchFoodCategodires())
    }

    // MARK: - Helpers
    // MARK: - Actions
    // MARK: - Objc Methods
}
