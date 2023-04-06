//
//  PostViewController.swift
//  Navigation
//

import UIKit

class PostViewController: UIViewController {
    private var post: PostOld?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = post?.title
        view.backgroundColor = .lightGray
        setupNavigationBar()
    }
    
    func setPost(post: PostOld) {
        self.post = post
    }
    
    private func setupNavigationBar() {
        let barItem = UIBarButtonItem(title: "Info", style: .done, target: self, action: #selector(barItemTouched))
        navigationItem.rightBarButtonItem = barItem
    }
    
    @objc func barItemTouched() {
        let vc = InfoViewController()
        present(vc, animated: true)
    }
}
