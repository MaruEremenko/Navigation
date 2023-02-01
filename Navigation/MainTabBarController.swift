import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }

    func setupControllers() {
        let feedVC = createController(viewController: FeedViewController(), itemName: "Новости", ItemImage: "newspaper")
        let profileVC = createController(viewController: ProfileViewController(), itemName: "Авторизация", ItemImage: "person.circle")
        viewControllers = [feedVC, profileVC]
    }

    func createController(viewController: UIViewController, itemName: String, ItemImage: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: ItemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0))  ,tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = item
        return navigationController
    }
}
