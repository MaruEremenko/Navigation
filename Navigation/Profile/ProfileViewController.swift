import UIKit

class ProfileViewController: UIViewController {
    
    let arrayPosts: [Post] = [
        Post(
            author: "Hipster Tom",
            description: "Hi, everyone!",
            image: "logo",
            likes: 2,
            views: 2
        ),
        Post(
            author: "Hipster Tom",
            description: "My avatar image",
            image: "Tom",
            likes: 5,
            views: 5
        ),
        Post(
            author: "Hipster Tom",
            description: "Love my cat Goirno",
            image: "Cat1",
            likes: 7,
            views: 7
        ),
        Post(
            author: "Hipster Tom",
            description: "Love my cat Richard",
            image: "Cat2",
            likes: 7,
            views: 7
        )
    ]
    
    let table: UITableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        self.table.register(ProfileTableViewCell.self, forCellReuseIdentifier: "profileTableViewCell")
        setupViews()
        
    }
    
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
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileTableViewCell", for: indexPath) as! ProfileTableViewCell
        cell.fillCell(post: arrayPosts[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return ProfileTableHeaderView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 220
    }
    
    
}



