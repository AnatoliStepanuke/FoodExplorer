import UIKit

final class TabBarController: UITabBarController {
    // MARK: - Constants
    // MARK: - Properties
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColor.shadowColor
        setupTabBarController()
    }

    // MARK: - Setups
    private func setupTabBarController() {
        viewControllers = [
            createNavigationController(
                for: ExploreViewController(),
                title: "Explore",
                image: UIImage(named: "explore")
            ),
            createNavigationController(
                for: MyOrderViewController(),
                title: "My Order",
                image: UIImage(named: "order")
            ),
            createNavigationController(
                for: FavouriteViewController(),
                title: "Favourite",
                image: UIImage(named: "favourite")
            ),
            createNavigationController(for: ProfileViewController(), title: "Profile", image: UIImage(named: "profile"))
        ]
        tabBar.tintColor = .red
    }

    // MARK: - Helpers
    private func createNavigationController(
        for rootViewController: UIViewController,
        title: String,
        image: UIImage?
    ) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        return navigationController
    }

    // MARK: - Actions
    // MARK: - Objc Methods
}
