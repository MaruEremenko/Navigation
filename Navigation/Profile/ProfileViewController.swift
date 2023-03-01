import UIKit

class ProfileViewController: UIViewController {
   let profileHeaderView = ProfileHeaderView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Profile"
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(profileHeaderView)
        profileHeaderView.frame = view.frame
    }
}


