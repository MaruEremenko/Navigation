import UIKit

class MainTabBarController: UITabBarController {
    
    private let profile = ProfileViewController()
    private let newsFeed = FeedViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        setupControllers()
    }

    func setupControllers() {
        let navigationProfile = UINavigationController(rootViewController: profile)
        let navigationNewsFeed = UINavigationController(rootViewController: newsFeed)
        
        profile.tabBarItem.title = "Profile"
        profile.tabBarItem.image = UIImage(systemName: "folder")
    
        newsFeed.tabBarItem.title = "Feed"
        newsFeed.tabBarItem.image = UIImage(systemName: "note")
        
    
        
        viewControllers = [navigationNewsFeed, navigationProfile]
    }
}
