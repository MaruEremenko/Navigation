import UIKit

class ProfileViewController: UIViewController, ProfileHeaderViewDelegate, ProfileTableViewCellDelegate {
    
    // MARK: - Properties
    
    var arrayPosts: [Post] = Post.getArray()
    
    let table: UITableView = UITableView(frame: .zero, style: .grouped)
    
    let profileHeaderView = ProfileHeaderView()
    
    private lazy var closeButton: UIButton = {
        let closeButton = UIButton(frame: CGRect(x: (UIScreen.main.bounds.width - 40), y: 40, width: 50, height: 50))
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTap), for: .touchUpInside)
        closeButton.alpha = 0
        return closeButton
    }()
    
    private let backgroundImageView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    
    private let avatarImageView: UIImageView = {
        let avatar = UIImageView()
        return avatar
    }()
    
    // MARK: - Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        self.table.register(ProfileTableViewCell.self, forCellReuseIdentifier: "profileTableViewCell")
        self.table.register(PhotosTableViewCell.self, forCellReuseIdentifier: "photosTableViewCell")
        setupViews()
        
    }
    
    // MARK: - Functions
    
    private func setupViews() {
        view.addSubview(table)
        table.backgroundColor = .lightGray
        table.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    private func animationAvatar(avatarImage: UIImage?) {
        view.addSubview(backgroundImageView)
        view.addSubview(closeButton)
        avatarImageView.image = avatarImage
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .center
        avatarImageView.frame = CGRect(x: 0, y: 0, width: (view.frame.width / 2), height: (view.frame.height / 2))
        view.addSubview(avatarImageView)
        UIView.animate(withDuration: 0.5) {
            self.avatarImageView.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.height)
            self.backgroundImageView.alpha = 0.7
        }
        
        UIButton.animate(withDuration: 0.3, delay: 0.5) {
            self.closeButton.alpha = 1
        }
    }
    
    func tapAvatarImage(avatarImage: UIImage?){
        animationAvatar(avatarImage: avatarImage)
        print("картинка нажата в Делегате")
    }
    
    @objc private func closeButtonTap() {
        UIButton.animate(withDuration: 0.3) {
            self.closeButton.alpha = 0
        }
        UIView.animate(withDuration: 0.5, delay: 0.3) {
            self.avatarImageView.frame.size = CGSize(width: (self.view.frame.width / 3.0), height: (self.view.frame.height / 3.0))
            self.backgroundImageView.alpha = 0
        } completion: { _ in
            self.backgroundImageView.removeFromSuperview()
            self.closeButton.removeFromSuperview()
            self.avatarImageView.removeFromSuperview()
        }
    }
    
    func addLikes(index: Int) {
        arrayPosts[index].likes += 1
    }
    
}

// MARK: - Extensions

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
           return arrayPosts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "photosTableViewCell", for: indexPath) as! PhotosTableViewCell
            cell.delegate = self
            cell.fillCell()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileTableViewCell", for: indexPath) as! ProfileTableViewCell
            cell.fillCell(post: arrayPosts[indexPath.row], index: indexPath.row)
            cell.delegate = self
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = ProfileTableHeaderView()
            headerView.profileHeaderView.delegate = self
            return headerView
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 220
        } else {
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            tapPhotoAction()
        } else {
            tapPostAction(post: arrayPosts[indexPath.row], number: indexPath.row)
        }
    }
    
    func tapPostAction(post: Post, number: Int) {
        let controller = ProfilePostViewController()
        controller.fillPost(post: post)
        navigationController?.pushViewController(controller, animated: true)
        arrayPosts[number].views += 1
        table.reloadData()
    }
}

extension ProfileViewController: PhotoTableViewCellDelegate {
    func tapPhotoAction() {
        navigationController?.pushViewController(PhotosViewController(), animated: true)
    }
    
    
}
    




