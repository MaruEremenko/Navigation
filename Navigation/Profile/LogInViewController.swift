//
//  LogInViewController.swift
//  Navigation
//
//  Created by Maru Eremenko on 30.03.2023.
//

import UIKit

class LogInViewController: UIViewController {

    private lazy var vkLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        title = "Login"
        setupView()
    }
    
    private func setupView() {
        view.addSubview(vkLogo)
        NSLayoutConstraint.activate([
            vkLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            vkLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vkLogo.widthAnchor.constraint(equalToConstant: 100),
            vkLogo.heightAnchor.constraint(equalToConstant: 100)
            
        ])
    }
}
