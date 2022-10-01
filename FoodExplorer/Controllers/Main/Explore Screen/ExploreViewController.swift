import UIKit

final class ExploreViewController: UIViewController, UITextFieldDelegate {
    // MARK: - Constants
    // CollectionView
//    private let discoveryCollectionView = DiscoveryUICollectionView(
//        height: 350,
//        lineSpacing: DiscoveryCollectionViewCell.Constants.galleryMinimumLineSpacing,
//        scrollDirection: .horizontal,
//        cellClass: DiscoveryCollectionViewCell.self,
//        identifier: DiscoveryCollectionViewCell.Constants.discoveryCollectionViewCell
//    )
//    private let topCategoriesCollectionView = TopCategoriesUICollectionView(
//        height: 140,
//        lineSpacing: 16,
//        scrollDirection: .horizontal,
//        cellClass: TopCategoriesCollectionViewCell.self,
//        identifier: TopCategoriesCollectionViewCell.Constants.topCategoriesCollectionViewCell
//    )

    // Label
//    private let headerLabel = ExploreUILabel(text: "Discovery new places", height: 36, fontSize: 30, fontColor: .black, xCGRect: 16)
//    private let footerLabel = ExploreUILabel(text: "Top categories", height: 24, fontSize: 20, fontColor: .black, xCGRect: 16)

    // TextField
//    private let searchField = ExploreUITextField()

    // ScrollView
//    private let scrollView = ExploreUIScrollView()

    // StackView
//    private let scrollStackViewContainer: UIStackView = {
//        let view = UIStackView()
//        view.axis = .vertical
//        view.spacing = 0
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()

    // View
//    private let subView = ExploreUIView(height: 690)

    // MARK: - Properties
    // MARK: - Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupView()
//        setupSearchField()
//        setupHeaderLabel()
//        setupDiscoveryCollectionView()
//        setupFooterLabel()
//        setupTopCategoriesCollectionView()
//    }

    // MARK: - Setups
//    private func setupView() {
//        view.addSubview(scrollView)
//        scrollView.anchor(
//            top: view.safeAreaLayoutGuide.topAnchor,
//            leading: view.safeAreaLayoutGuide.leadingAnchor,
//            trailing: view.safeAreaLayoutGuide.trailingAnchor,
//            bottom: view.safeAreaLayoutGuide.bottomAnchor
//        )
//        scrollView.addSubview(scrollStackViewContainer)
//        scrollStackViewContainer.anchor(
//            top: scrollView.topAnchor,
//            leading: scrollView.leadingAnchor,
//            trailing: scrollView.trailingAnchor,
//            bottom: scrollView.bottomAnchor
//        )
//        scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
//        scrollStackViewContainer.addArrangedSubview(subView)
//        subView.addSubview(searchField)
//        subView.addSubview(headerLabel)
//        subView.addSubview(discoveryCollectionView)
//        subView.addSubview(footerLabel)
//        subView.addSubview(topCategoriesCollectionView)
//    }

//    private func setupSearchField() {
//        searchField.delegate = self
//        searchField.anchor(
//            top: subView.topAnchor,
//            leading: subView.leadingAnchor,
//            trailing: subView.trailingAnchor,
//            bottom: nil,
//            padding: .init(top: 0, left: 16, bottom: 0, right: 16)
//        )
//    }

//    private func setupHeaderLabel() {
//        headerLabel.anchor(
//            top: searchField.bottomAnchor,
//            leading: subView.leadingAnchor,
//            trailing: subView.trailingAnchor,
//            bottom: nil,
//            padding: .init(top: 24, left: 16, bottom: 0, right: 16)
//        )
//    }
//
//    private func setupDiscoveryCollectionView() {
//        discoveryCollectionView.anchor(
//            top: headerLabel.bottomAnchor,
//            leading: subView.leadingAnchor,
//            trailing: subView.trailingAnchor,
//            bottom: nil,
//            padding: .init(top: 18, left: 0, bottom: 0, right: 0)
//        )
//        discoveryCollectionView.setCells(restaurants: Restaurant.fetchRestaurants())
//    }
//
//    private func setupFooterLabel() {
//        footerLabel.anchor(
//            top: discoveryCollectionView.bottomAnchor,
//            leading: subView.leadingAnchor,
//            trailing: subView.trailingAnchor,
//            bottom: nil,
//            padding: .init(top: 24, left: 16, bottom: 0, right: 16)
//        )
//    }
//
//    private func setupTopCategoriesCollectionView() {
//        topCategoriesCollectionView.anchor(
//            top: footerLabel.bottomAnchor,
//            leading: subView.leadingAnchor,
//            trailing: subView.trailingAnchor,
//            bottom: nil,
//            padding: .init(top: 16, left: 0, bottom: 0, right: 0)
//        )
//        topCategoriesCollectionView.setCells(topCategories: TopCategory.fetchTopCategories())
//    }

    // MARK: - Helpers
    // MARK: - Actions
    // MARK: - Objc Methods
}

final class FoodSection {
    let type: FoodSectionType
//    let sectionName: String
    internal init(type: FoodSectionType) {
        self.type = type
//        self.sectionName = sectionName
    }
}

enum FoodSectionType {
    case restaurants([Restaurant])
    case categories([TopCategory])
}

final class MyVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private let sections = [
        FoodSection(
            type: .restaurants(Restaurant.fetchRestaurants())
//            sectionName: "Discovery new places"
        ),
        FoodSection(
            type: .categories(TopCategory.fetchTopCategories())
//            sectionName: "Top Categories"
        ),
        FoodSection(
            type: .restaurants(Restaurant.fetchRestaurants())
//            sectionName: "Discovery new places"
        ),
        FoodSection(
            type: .categories(TopCategory.fetchTopCategories())
//            sectionName: "Top Categories"
        )
    ]

    private let searchField = ExploreUITextField()
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchField)
        view.addSubview(tableView)
        searchField.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor,
            bottom: nil,
            padding: .init(top: 0, left: 16, bottom: 0, right: 16)
        )
        tableView.anchor(
            top: searchField.bottomAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor
        )
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(DiscoveryCell.self, forCellReuseIdentifier: "PlacesCell")
        tableView.register(TopCategoriesCell.self, forCellReuseIdentifier: "CategoriesCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section].type {
        case .restaurants: return 1
        case .categories: return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section].type {
        case .restaurants(let places):
            let cell = DiscoveryCell()
            cell.collectionView.restaurants = places
            return cell
        case .categories(let categories):
            let cell = TopCategoriesCell()
            cell.collectionView.topCategories = categories
            return cell
        }
    }

//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return sections[section].sectionName
//    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch sections[section].type {
        case .restaurants:
            let view = UIView()
            let label = UILabel(frame: CGRect(x: 16, y: 0, width: tableView.frame.width, height: 36))
            label.text = "Discovery new places"
            label.font = .systemFont(ofSize: 30, weight: .regular)
            label.textColor = .black
            view.addSubview(label)
            view.backgroundColor = .white
            return view
        case .categories:
            let header = ExploreUILabel(text: "Top categories", height: 24, fontSize: 20, fontColor: .black, xFrame: 16, heightFrame: 24)
            let view = UIView()
            view.addSubview(header)
//            let label = UILabel(frame: CGRect(x: 16, y: 0, width: tableView.frame.width, height: 24))
//            label.text = "Top categories"
//            label.font = .systemFont(ofSize: 20, weight: .regular)
//            label.textColor = .black
//            view.addSubview(label)
//            view.backgroundColor = .white
            return view
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch sections[section].type {
        case .restaurants: return 45
        case .categories: return 35
        }
    }
}

final class DiscoveryCell: UITableViewCell {
    let collectionView = DiscoveryUICollectionView(
        height: 350,
        lineSpacing: DiscoveryCollectionViewCell.Constants.galleryMinimumLineSpacing,
        scrollDirection: .horizontal,
        cellClass: DiscoveryCollectionViewCell.self,
        identifier: DiscoveryCollectionViewCell.Constants.discoveryCollectionViewCell
    )

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        collectionView.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            trailing: contentView.trailingAnchor,
            bottom: contentView.bottomAnchor
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

final class TopCategoriesCell: UITableViewCell {
    let collectionView = TopCategoriesUICollectionView(
        height: 140,
        lineSpacing: 16,
        scrollDirection: .horizontal,
        cellClass: TopCategoriesCollectionViewCell.self,
        identifier: TopCategoriesCollectionViewCell.Constants.topCategoriesCollectionViewCell
    )

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        collectionView.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            trailing: contentView.trailingAnchor,
            bottom: contentView.bottomAnchor
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
