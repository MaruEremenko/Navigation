//
//  PostViewController.swift
//  Navigation
//
//  Created by Maru Eremenko on 25.04.2023.
//

import UIKit

class ProfilePostViewController: UIViewController{
    
    private let titleLabel: UILabel = {
       let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 20, weight: .bold)
        title.textColor = .black
        title.numberOfLines = 2
        return title
    }()
    
    private let photoImage: UIImageView = {
        let photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.contentMode = .scaleAspectFit
        photo.backgroundColor = .black
        return photo
    }()
    
    private let descriptionLabel: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.font = .systemFont(ofSize: 14)
        description.textColor = .black
        description.numberOfLines = 0
        return description
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        self.navigationController?.navigationBar.isHidden = false
        navigationItem.hidesBackButton = false
    
        setupViews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    func fillPost(post: Post) {
        titleLabel.text = post.author
        photoImage.image = UIImage(named: post.image)
        descriptionLabel.text = post.description
    }
    
    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(photoImage)
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            photoImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            photoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoImage.heightAnchor.constraint(equalTo: view.widthAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: photoImage.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
        ])
    }
}

