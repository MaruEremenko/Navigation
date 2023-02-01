//
//  InfoViewController.swift
//  Navigation
//
//  Created by Anastasiia on 31.01.2023.
//

import UIKit

class InfoViewController: UIViewController {
    private let button = UIButton()
    
    private let alert = UIAlertController(title: "Some alert", message: "Some message", preferredStyle: .alert)
    private let getMessageAction = UIAlertAction(title: "Get message", style: .default) { _ in
        print("Some message")
    }
    private let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupButton()
        setupAlert()
    }
    
    @objc func presentAlert() {
        present(alert, animated: true)
    }
    
    private func setupButton() {
        button.setTitle("Get alert", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(presentAlert), for: .touchUpInside)
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func setupAlert() {
        alert.addAction(getMessageAction)
        alert.addAction(cancelAction)
    }
}
