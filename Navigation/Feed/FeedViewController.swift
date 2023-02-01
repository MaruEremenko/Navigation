//
//  ViewController.swift
//  Navigation
//
//  Created by Anastasiia on 28.01.2023.
//

import UIKit

class FeedViewController: UIViewController {
    private let post = Post(title: "Some post")
    
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
    
    private func setupButton() {
        button.setTitle("Добавить пост", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }


    @objc func buttonTouched() {
        let vc = PostViewController()
        vc.setPost(post: post)
        navigationController?.pushViewController(vc, animated: true)
    }
}

