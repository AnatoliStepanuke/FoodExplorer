import UIKit

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
