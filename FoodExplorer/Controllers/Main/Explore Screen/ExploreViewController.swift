import UIKit

final class FoodSection {
    // MARK: - Constants
    let type: FoodSectionType

    // MARK: - Init
    internal init(type: FoodSectionType) {
        self.type = type
    }
}

enum FoodSectionType {
    case restaurants([Restaurant])
    case categories([TopCategory])
}

final class ExploreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: - Constants
    private let sections = [
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
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            padding: .init(top: 15, left: 0, bottom: 15, right: 0)
        )
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.register(DiscoveryTableViewCell.self, forCellReuseIdentifier: "PlacesCell")
        tableView.register(TopCategoriesTableViewCell.self, forCellReuseIdentifier: "CategoriesCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - TableView
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
        switch sections[section].type {
        case .restaurants:
            let header = ExploreUILabel(
                text: "Discovery new places",
                height: 36,
                fontSize: 30,
                fontColor: .black,
                xFrame: 16,
                widthFrame: Int(view.frame.width),
                heightFrame: 36
            )
            let view = UIView()
            view.addSubview(header)
            return view
        case .categories:
            let header = ExploreUILabel(
                text: "Top categories",
                height: 24,
                fontSize: 20,
                fontColor: .black,
                xFrame: 16,
                widthFrame: Int(view.frame.width),
                heightFrame: 24
            )
            let view = UIView()
            view.addSubview(header)
            return view
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch sections[section].type {
        case .restaurants: return 50
        case .categories: return 45
        }
    }
}
