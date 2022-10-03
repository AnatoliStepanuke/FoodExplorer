import UIKit

final class ExploreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: - Constants
    private let foodSections = [
        FoodSection(
            type: .restaurants(Restaurant.fetchRestaurants())
        ),
        FoodSection(
            type: .categories(TopCategory.fetchTopCategories())
        )
    ]
    private let searchField = ExploreUITextField()
    private let tableView = UITableView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchField()
        setupTableView()
    }

    // MARK: - Setups
    private func setupSearchField() {
        view.addSubview(searchField)
        searchField.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor,
            bottom: nil,
            padding: .init(top: 0, left: 16, bottom: 0, right: 16)
        )
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.anchor(
            top: searchField.bottomAnchor,
            leading: view.safeAreaLayoutGuide.leadingAnchor,
            trailing: view.safeAreaLayoutGuide.trailingAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            padding: .init(top: 15, left: 0, bottom: 15, right: 0)
        )
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(
            DiscoveryTableViewCell.self,
            forCellReuseIdentifier: DiscoveryTableViewCell.Constants.discoveryTableViewCell
        )
        tableView.register(
            TopCategoriesTableViewCell.self,
            forCellReuseIdentifier: TopCategoriesTableViewCell.Constants.topCategoriesTableViewCell
        )
    }

    // MARK: - TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        foodSections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch foodSections[section].type {
        case .restaurants: return 1
        case .categories: return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch foodSections[indexPath.section].type {
        case .restaurants(let places):
            let cell = DiscoveryTableViewCell()
            cell.collectionView.restaurants = places
            return cell
        case .categories(let categories):
            let cell = TopCategoriesTableViewCell()
            cell.collectionView.topCategories = categories
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch foodSections[section].type {
        case .restaurants:
            let headerDiscovery = ExploreUILabel(
                text: "Discovery new places",
                height: 36,
                fontSize: 30,
                fontColor: .black,
                xFrame: 16,
                widthFrame: Int(view.frame.width),
                heightFrame: 36
            )
            let view = UIView()
            view.addSubview(headerDiscovery)
            return view
        case .categories:
            let headerTopCategories = ExploreUILabel(
                text: "Top categories",
                height: 24,
                fontSize: 20,
                fontColor: .black,
                xFrame: 16,
                widthFrame: Int(view.frame.width),
                heightFrame: 24
            )
            let view = UIView()
            view.addSubview(headerTopCategories)
            return view
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch foodSections[section].type {
        case .restaurants: return 50
        case .categories: return 45
        }
    }
}
