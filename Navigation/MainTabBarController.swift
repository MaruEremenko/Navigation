import UIKit

class MainTabBarController: UITabBarController {
    
    private let profile = ProfileViewController()
    private let newsFeed = FeedViewController()
    private let login = LogInViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        setupControllers()
    }

    func setupControllers() {
        let navigationLogin = UINavigationController(rootViewController: login)
        let navigationNewsFeed = UINavigationController(rootViewController: newsFeed)
        
        login.tabBarItem.title = "Profile"
        login.tabBarItem.image = UIImage(systemName: "folder")
        navigationLogin.navigationBar.isHidden = true
    
        newsFeed.tabBarItem.title = "Feed"
        newsFeed.tabBarItem.image = UIImage(systemName: "note")
        
    
        
        viewControllers = [navigationNewsFeed, navigationLogin]
    }
}
